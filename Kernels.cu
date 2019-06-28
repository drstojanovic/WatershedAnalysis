
//// KERNEL FUNCTIONS IMPLEMENTATION //////////////////////////////////////////////////////////////

#include "Kernels.h"

//// DEPRESSION FILLING ///////////////////////////////////////////////////////////////////////////

__global__ void DepressionFillingKernel(
	float* wDEM,
	float* zDEM,
	int width,
	int height,
	float epsilon,
	bool* pFinished)
{
	int row = blockIdx.y * O_BLOCK_WIDTH + threadIdx.y + 1;
	int col = blockIdx.x * O_BLOCK_WIDTH + threadIdx.x + 1;

	int row_i = row - 1;
	int col_i = col - 1;

	int row_s = threadIdx.y + 1;
	int col_s = threadIdx.x + 1;

	__shared__ float ds_wDEM[I_BLOCK_WIDTH][I_BLOCK_WIDTH];

	int center;

	float zDEMCenter;
	float wDEMCenter;
	float wDEMNeighbor;


	if (row_i < height && col_i < width)
	{
		ds_wDEM[threadIdx.y][threadIdx.x] = wDEM[row_i * width + col_i];
	}

	__syncthreads();

	if (row < height - 1 && col < width - 1 && threadIdx.y < O_BLOCK_WIDTH && threadIdx.x < O_BLOCK_WIDTH)
	{
		center = row * width + col;

		zDEMCenter = zDEM[center];
		wDEMCenter = ds_wDEM[row_s][col_s];

		if (wDEMCenter > zDEMCenter)
		{
			for (int k = row_s - 1; k <= row_s + 1; ++k)
			{
				for (int l = col_s - 1; l <= col_s + 1; ++l)
				{
					if (k != row_s || l != col_s)
					{
						wDEMNeighbor = ds_wDEM[k][l] + epsilon;

						if (zDEMCenter >= wDEMNeighbor)
						{
							wDEMCenter = zDEMCenter;
							ds_wDEM[row_s][col_s] = zDEMCenter;
							*pFinished = false;
						}
						else
						{
							if (wDEMCenter > wDEMNeighbor)
							{
								wDEMCenter = wDEMNeighbor;
								ds_wDEM[row_s][col_s] = wDEMNeighbor;
								*pFinished = false;
							}
						}
					}
				}
			}

			wDEM[center] = wDEMCenter;
		}
	}
}

void DepressionFillingKernel_Wrapper(dim3 dimGrid, dim3 dimBlock,
	float* wDEM,
	float* zDEM,
	int width,
	int height,
	float epsilon,
	bool* pFinished)
{
	DepressionFillingKernel<<<dimGrid, dimBlock>>>
		(wDEM, zDEM, width, height, epsilon, pFinished);
}

//// FLOW-TRANSFER-MATRIX FLOW ACCUMULATION ///////////////////////////////////////////////////////

__global__ void FlowAccumulationKernelM(
	float* flowOld,
	float* flowNew,
	float* flowAcc,
	float* flowFracs,
	unsigned char* flowRevDirs,
	int width,
	int height,
	bool* pFinished)
{
	int row = blockIdx.y * blockDim.y + threadIdx.y;
	int col = blockIdx.x * blockDim.x + threadIdx.x;

	float newFlow;
	unsigned char flowRevDir;

	int center;
	int stridedCenter;

	int subCenterWidth;
	int addCenterWidth;

	if (row < height && col < width)
	{
		center = row * width + col;
		stridedCenter = row * width * 8 + col;

		subCenterWidth = center - width;
		addCenterWidth = center + width;

		flowRevDir = flowRevDirs[center];
		newFlow = 0.0f;

		if (flowRevDir & 1)   newFlow += flowFracs[stridedCenter] * flowOld[subCenterWidth];
		stridedCenter += width;

		if (flowRevDir & 2)   newFlow += flowFracs[stridedCenter] * flowOld[subCenterWidth + 1];
		stridedCenter += width;

		if (flowRevDir & 4)   newFlow += flowFracs[stridedCenter] * flowOld[center + 1];
		stridedCenter += width;

		if (flowRevDir & 8)   newFlow += flowFracs[stridedCenter] * flowOld[addCenterWidth + 1];
		stridedCenter += width;

		if (flowRevDir & 16)  newFlow += flowFracs[stridedCenter] * flowOld[addCenterWidth];
		stridedCenter += width;

		if (flowRevDir & 32)  newFlow += flowFracs[stridedCenter] * flowOld[addCenterWidth - 1];
		stridedCenter += width;

		if (flowRevDir & 64)  newFlow += flowFracs[stridedCenter] * flowOld[center - 1];
		stridedCenter += width;

		if (flowRevDir & 128) newFlow += flowFracs[stridedCenter] * flowOld[subCenterWidth - 1];


		flowAcc[center] += newFlow;
		flowNew[center] = newFlow;

		if (newFlow > 0.0f)
		{
			*pFinished = false;
		}
	}
}

void FlowAccumulationKernelM_Wrapper(dim3 dimGrid, dim3 dimBlock,
	float* flowOld,
	float* flowNew,
	float* flowAcc,
	float* flowFracs,
	unsigned char* flowRevDirs,
	int width,
	int height,
	bool* pFinished)
{
	FlowAccumulationKernelM<<<dimGrid, dimBlock>>>
		(flowOld, flowNew, flowAcc, flowFracs, flowRevDirs, width, height, pFinished);
}

//// GRAPH-BASED FLOW ACCUMULATION ////////////////////////////////////////////////////////////////

__global__ void FlowAccumulationKernelG(
	float* flowAcc,
	float* flowFracs,
	unsigned char* flowDirs,
	unsigned char* flowRevDirs,
	int* inDegreeMatrix,
	int width,
	int height,
	bool* pFinished)
{
	int row = blockIdx.y * blockDim.y + threadIdx.y;
	int col = blockIdx.x * blockDim.x + threadIdx.x;

	int center;
	int stridedCenter;

	int subCenterWidth;
	int addCenterWidth;

	float newFlow;
	unsigned char dir;


	if (row < height && col < width)
	{
		center = row * width + col;

		if (inDegreeMatrix[center] == 0)
		{
			inDegreeMatrix[center] = -1;
			*pFinished = false;

			subCenterWidth = center - width;
			addCenterWidth = center + width;

			stridedCenter = row * width * 8 + col;
			newFlow = 0.0f;

			dir = flowRevDirs[center];

			if (dir & 1)   newFlow += flowFracs[stridedCenter] * flowAcc[subCenterWidth];
			stridedCenter += width;

			if (dir & 2)   newFlow += flowFracs[stridedCenter] * flowAcc[subCenterWidth + 1];
			stridedCenter += width;

			if (dir & 4)   newFlow += flowFracs[stridedCenter] * flowAcc[center + 1];
			stridedCenter += width;

			if (dir & 8)   newFlow += flowFracs[stridedCenter] * flowAcc[addCenterWidth + 1];
			stridedCenter += width;

			if (dir & 16)  newFlow += flowFracs[stridedCenter] * flowAcc[addCenterWidth];
			stridedCenter += width;

			if (dir & 32)  newFlow += flowFracs[stridedCenter] * flowAcc[addCenterWidth - 1];
			stridedCenter += width;

			if (dir & 64)  newFlow += flowFracs[stridedCenter] * flowAcc[center - 1];
			stridedCenter += width;

			if (dir & 128) newFlow += flowFracs[stridedCenter] * flowAcc[subCenterWidth - 1];

			flowAcc[center] += newFlow;

			dir = flowDirs[center];

			if (dir & 1)   atomicSub(&inDegreeMatrix[subCenterWidth],     1);
			if (dir & 2)   atomicSub(&inDegreeMatrix[subCenterWidth + 1], 1);
			if (dir & 4)   atomicSub(&inDegreeMatrix[center + 1],         1);
			if (dir & 8)   atomicSub(&inDegreeMatrix[addCenterWidth + 1], 1);
			if (dir & 16)  atomicSub(&inDegreeMatrix[addCenterWidth],     1);
			if (dir & 32)  atomicSub(&inDegreeMatrix[addCenterWidth - 1], 1);
			if (dir & 64)  atomicSub(&inDegreeMatrix[center - 1],         1);
			if (dir & 128) atomicSub(&inDegreeMatrix[subCenterWidth - 1], 1);
		}
	}
}

void FlowAccumulationKernelG_Wrapper(dim3 dimGrid, dim3 dimBlock,
	float* flowAcc,
	float* flowFracs,
	unsigned char* flowDirs,
	unsigned char* flowRevDirs,
	int* inDegreeMatrix,
	int width,
	int height,
	bool* pFinished)
{

	FlowAccumulationKernelG<<<dimGrid, dimBlock>>>
		(flowAcc, flowFracs, flowDirs, flowRevDirs, inDegreeMatrix, width, height, pFinished);

	
}

///////////////////////////////////////////////////////////////////////////////////////////////////



