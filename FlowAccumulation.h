
#ifndef __FLOW_ACCUMULATION_H__
#define __FLOW_ACCUMULATION_H__

//// FLOW ACCUMULATION IMPLEMENTATIONS ////////////////////////////////////////////////////////////

#include <cmath>
#include <algorithm>
#include <omp.h>

//#include <iostream>

#include "Kernels.h"

//// AUXILIARY FUNCTIONS //////////////////////////////////////////////////////////////////////////

void RecordFlowFraction(
	bool rightCell,
	int direction,
	int width,
	float* flowFracs,
	float flowFrac,
	int row,
	int col,
	bool rowOrder)
{
	if (rightCell)
	{
		int position = rowOrder ?
			(row * width + col) * 8 + direction :
			row * width * 8 + col + width * direction;

		flowFracs[position] = flowFrac;
	}
}

void ComputeFlowDirections(
	float* wDEM,
	int width,
	int height,
	int* inDegreeMatrix,
	unsigned char* flowDirs,
	unsigned char* flowRevDirs)
{
	int center;
	float wDEMCenter;

	int inDegree;

	unsigned char flowDir;
	unsigned char flowRevDir;

	for (int i = 0; i < height; ++i)
	{
		for (int j = 0; j < width; ++j)
		{
			center = i * width + j;
			wDEMCenter = wDEM[center];

			if (flowDirs != NULL)
			{
				flowDir = 0;

				if (i - 1 >= 0                      && wDEMCenter > wDEM[center - width])     flowDir |= 1;
				if (i - 1 >= 0 && j + 1 < width     && wDEMCenter > wDEM[center - width + 1]) flowDir |= 2;
				if (j + 1 < width                   && wDEMCenter > wDEM[center + 1])         flowDir |= 4;
				if (i + 1 < height && j + 1 < width && wDEMCenter > wDEM[center + width + 1]) flowDir |= 8;
				if (i + 1 < height                  && wDEMCenter > wDEM[center + width])     flowDir |= 16;
				if (i + 1 < height && j - 1 >= 0    && wDEMCenter > wDEM[center + width - 1]) flowDir |= 32;
				if (j - 1 >= 0                      && wDEMCenter > wDEM[center - 1])         flowDir |= 64;
				if (i - 1 >= 0 && j - 1 >= 0        && wDEMCenter > wDEM[center - width - 1]) flowDir |= 128;

				flowDirs[center] = flowDir;
			}

			if (inDegreeMatrix != NULL)
			{
				inDegree = 0;

				if (i - 1 >= 0                      && wDEMCenter < wDEM[center - width])     ++inDegree;
				if (i - 1 >= 0 && j + 1 < width     && wDEMCenter < wDEM[center - width + 1]) ++inDegree;
				if (j + 1 < width                   && wDEMCenter < wDEM[center + 1])         ++inDegree;
				if (i + 1 < height && j + 1 < width && wDEMCenter < wDEM[center + width + 1]) ++inDegree;
				if (i + 1 < height                  && wDEMCenter < wDEM[center + width])     ++inDegree;
				if (i + 1 < height && j - 1 >= 0    && wDEMCenter < wDEM[center + width - 1]) ++inDegree;
				if (j - 1 >= 0                      && wDEMCenter < wDEM[center - 1])         ++inDegree;
				if (i - 1 >= 0 && j - 1 >= 0        && wDEMCenter < wDEM[center - width - 1]) ++inDegree;

				inDegreeMatrix[center] = inDegree;
			}

			flowRevDir = 0;

			if (i - 1 >= 0                      && wDEMCenter < wDEM[center - width])     flowRevDir |= 1;
			if (i - 1 >= 0 && j + 1 < width     && wDEMCenter < wDEM[center - width + 1]) flowRevDir |= 2;
			if (j + 1 < width                   && wDEMCenter < wDEM[center + 1])         flowRevDir |= 4;
			if (i + 1 < height && j + 1 < width && wDEMCenter < wDEM[center + width + 1]) flowRevDir |= 8;
			if (i + 1 < height                  && wDEMCenter < wDEM[center + width])     flowRevDir |= 16;
			if (i + 1 < height && j - 1 >= 0    && wDEMCenter < wDEM[center + width - 1]) flowRevDir |= 32;
			if (j - 1 >= 0                      && wDEMCenter < wDEM[center - 1])         flowRevDir |= 64;
			if (i - 1 >= 0 && j - 1 >= 0        && wDEMCenter < wDEM[center - width - 1]) flowRevDir |= 128;

			flowRevDirs[center] = flowRevDir;
		}
	}
}

void ComputeFlowFractions(
	float* wDEM,
	int width,
	int height,
	float cellSize,
	float* flowFracs,
	bool rowOrder)
{
	int length = width * height * 8;

	for (int i = 0; i < length; ++i)
	{
		flowFracs[i] = 0.0f;
	}

	float wDEMCenter;
	float wDEMNeighbor;

	bool isOutlet;

	float maxDownslope;
	float totalDownslope;
	float downslope;
	float cellDistance;
	float p;

	float flowFrac;

	for (int i = 0; i < height; ++i)
	{
		for (int j = 0; j < width; ++j)
		{
			wDEMCenter = wDEM[i * width + j];
			isOutlet = true;

			maxDownslope = 0.0f;
			totalDownslope = 0.0f;

			// computing maximum downslope //

			for (int k = i - 1; k <= i + 1; ++k)
			{
				for (int l = j - 1; l <= j + 1; ++l)
				{
					if (k >= 0 && k < height && l >= 0 && l < width)
					{
						if (k != i || l != j)
						{
							wDEMNeighbor = wDEM[k * width + l];

							if (wDEMCenter > wDEMNeighbor)
							{
								cellDistance = cellSize * ((k != i && l != j) ? sqrt(2.0f) : 1.0f);

								downslope = (wDEMCenter - wDEMNeighbor) / cellDistance;
								maxDownslope = std::max(downslope, maxDownslope);

								isOutlet = false;
							}
						}
					}
				}
			}

			if (!isOutlet)
			{
				p = 8.9f * std::min(1.0f, maxDownslope) + 1.1f;

				// computing sum of all downslopes //

				for (int k = i - 1; k <= i + 1; ++k)
				{
					for (int l = j - 1; l <= j + 1; ++l)
					{
						if (k >= 0 && k < height && l >= 0 && l < width)
						{
							if (k != i || l != j)
							{
								wDEMNeighbor = wDEM[k * width + l];

								if (wDEMCenter > wDEMNeighbor)
								{
									cellDistance = cellSize * ((k != i && l != j) ? sqrt(2.0f) : 1.0f);
									downslope = (wDEMCenter - wDEMNeighbor) / cellDistance;

									totalDownslope += pow(downslope, p) * ((k != i && l != j) ? 0.354f : 0.5f);
								}
							}
						}
					}
				}

				// computing flow fractions //

				for (int k = i - 1; k <= i + 1; ++k)
				{
					for (int l = j - 1; l <= j + 1; ++l)
					{
						if (k >= 0 && k < height && l >= 0 && l < width)
						{
							if (k != i || l != j)
							{
								wDEMNeighbor = wDEM[k * width + l];

								if (wDEMCenter > wDEMNeighbor)
								{
									cellDistance = cellSize * ((k != i && l != j) ? sqrt(2.0f) : 1.0f);
									downslope = (wDEMCenter - wDEMNeighbor) / cellDistance;

									downslope = pow(downslope, p) * ((k != i && l != j) ? 0.354f : 0.5f);
									flowFrac = downslope / totalDownslope;

									RecordFlowFraction(k == i + 1 && l == j,     0, width, flowFracs, flowFrac, k, l, rowOrder);
									RecordFlowFraction(k == i + 1 && l == j - 1, 1, width, flowFracs, flowFrac, k, l, rowOrder);
									RecordFlowFraction(k == i     && l == j - 1, 2, width, flowFracs, flowFrac, k, l, rowOrder);
									RecordFlowFraction(k == i - 1 && l == j - 1, 3, width, flowFracs, flowFrac, k, l, rowOrder);
									RecordFlowFraction(k == i - 1 && l == j,     4, width, flowFracs, flowFrac, k, l, rowOrder);
									RecordFlowFraction(k == i - 1 && l == j + 1, 5, width, flowFracs, flowFrac, k, l, rowOrder);
									RecordFlowFraction(k == i     && l == j + 1, 6, width, flowFracs, flowFrac, k, l, rowOrder);
									RecordFlowFraction(k == i + 1 && l == j + 1, 7, width, flowFracs, flowFrac, k, l, rowOrder);
								}
							}
						}
					}
				}
			}
		}
	}
}

//// CPU IMPLEMENTATIONS (M : Flow-Transfer-Matrix, G : Graph-Based) //////////////////////////////

void FlowAccumulationM_CPU_ST(
	float* flowAcc,
	float* wDEM,
	int width,
	int height,
	float cellSize)
{
	int length = width * height;

	unsigned char* flowRevDirs = new unsigned char[length];
	float* flowFracs = new float[length * 8];

	ComputeFlowDirections(wDEM, width, height, NULL, NULL, flowRevDirs);
	ComputeFlowFractions(wDEM, width, height, cellSize, flowFracs, true);

	float* flow1 = new float[length];
	float* flow2 = new float[length];

	float** pFlowOld = &flow1;
	float** pFlowNew = &flow2;

	for (int i = 0; i < length; ++i)
	{
		flowAcc[i] = flow1[i] = 1.0f;
	}

	float newFlow;
	unsigned char flowRevDir;

	int center;
	int stridedCenter;

	bool finished = false;

	while (!finished)
	{
		finished = true;

		for (int i = 0; i < height; ++i)
		{
			for (int j = 0; j < width; ++j)
			{
				center = i * width + j;
				stridedCenter = center * 8;

				flowRevDir = flowRevDirs[center];
				newFlow = 0.0f;

				if (flowRevDir & 1)   newFlow += flowFracs[stridedCenter + 0] * (*pFlowOld)[center - width];
				if (flowRevDir & 2)   newFlow += flowFracs[stridedCenter + 1] * (*pFlowOld)[center - width + 1];
				if (flowRevDir & 4)   newFlow += flowFracs[stridedCenter + 2] * (*pFlowOld)[center + 1];
				if (flowRevDir & 8)   newFlow += flowFracs[stridedCenter + 3] * (*pFlowOld)[center + width + 1];
				if (flowRevDir & 16)  newFlow += flowFracs[stridedCenter + 4] * (*pFlowOld)[center + width];
				if (flowRevDir & 32)  newFlow += flowFracs[stridedCenter + 5] * (*pFlowOld)[center + width - 1];
				if (flowRevDir & 64)  newFlow += flowFracs[stridedCenter + 6] * (*pFlowOld)[center - 1];
				if (flowRevDir & 128) newFlow += flowFracs[stridedCenter + 7] * (*pFlowOld)[center - width - 1];

				flowAcc[center] += newFlow;
				(*pFlowNew)[center] = newFlow;

				if (newFlow > 0.0f)
				{
					finished = false;
				}
			}
		}

		float** pFlowTemp = pFlowOld;

		pFlowOld = pFlowNew;
		pFlowNew = pFlowTemp;
	}

	delete[] flowRevDirs;
	delete[] flowFracs;
	delete[] flow1;
	delete[] flow2;
}

void FlowAccumulationM_CPU_MT(
	float* flowAcc,
	float* wDEM,
	int width,
	int height,
	float cellSize,
	int numThreads)
{
	int length = width * height;

	unsigned char* flowRevDirs = new unsigned char[length];
	float* flowFracs = new float[length * 8];

	ComputeFlowDirections(wDEM, width, height, NULL, NULL, flowRevDirs);
	ComputeFlowFractions(wDEM, width, height, cellSize, flowFracs, true);

	float* flow1 = new float[length];
	float* flow2 = new float[length];

	float** pFlowOld = &flow1;
	float** pFlowNew = &flow2;

	for (int i = 0; i < length; ++i)
	{
		flowAcc[i] = flow1[i] = 1.0f;
	}

	bool finished = false;
	omp_set_num_threads(numThreads);

	#pragma omp parallel
	{
		int threadId = omp_get_thread_num();

		float newFlow;
		unsigned char flowRevDir;

		int center;
		int stridedCenter;

		while (!finished)
		{
			#pragma omp barrier

			finished = true;

			for (int i = threadId; i < height; i += numThreads)
			{
				for (int j = 0; j < width; ++j)
				{
					center = i * width + j;
					stridedCenter = center * 8;

					flowRevDir = flowRevDirs[center];
					newFlow = 0.0f;

					if (flowRevDir & 1)   newFlow += flowFracs[stridedCenter + 0] * (*pFlowOld)[center - width];
					if (flowRevDir & 2)   newFlow += flowFracs[stridedCenter + 1] * (*pFlowOld)[center - width + 1];
					if (flowRevDir & 4)   newFlow += flowFracs[stridedCenter + 2] * (*pFlowOld)[center + 1];
					if (flowRevDir & 8)   newFlow += flowFracs[stridedCenter + 3] * (*pFlowOld)[center + width + 1];
					if (flowRevDir & 16)  newFlow += flowFracs[stridedCenter + 4] * (*pFlowOld)[center + width];
					if (flowRevDir & 32)  newFlow += flowFracs[stridedCenter + 5] * (*pFlowOld)[center + width - 1];
					if (flowRevDir & 64)  newFlow += flowFracs[stridedCenter + 6] * (*pFlowOld)[center - 1];
					if (flowRevDir & 128) newFlow += flowFracs[stridedCenter + 7] * (*pFlowOld)[center - width - 1];

					flowAcc[center] += newFlow;

	                //#pragma omp atomic 

					(*pFlowNew)[center] = newFlow;

					if (newFlow > 0.0f)
					{
						finished = false;
					}
				}
			}

			#pragma omp master
			{
				float** pFlowTemp = pFlowOld;

				pFlowOld = pFlowNew;
				pFlowNew = pFlowTemp;
			}

			#pragma omp barrier
		}
	}

	delete[] flowRevDirs;
	delete[] flowFracs;
	delete[] flow1;
	delete[] flow2;
}

void FlowAccumulationG_CPU_ST(
	float* flowAcc,
	float* wDEM,
	int width,
	int height,
	float cellSize)
{
	int length = width * height;

	int* inDegreeMatrix = new int[length];

	unsigned char* flowDirs = new unsigned char[length];
	unsigned char* flowRevDirs = new unsigned char[length];

	float* flowFracs = new float[length * 8];

	ComputeFlowDirections(wDEM, width, height, inDegreeMatrix, flowDirs, flowRevDirs);
	ComputeFlowFractions(wDEM, width, height, cellSize, flowFracs, true);

	for (int i = 0; i < length; ++i)
	{
		flowAcc[i] = 1.0f;
	}

	float newFlow;

	unsigned char flowDir;
	unsigned char flowRevDir;

	int center;
	int stridedCenter;

	bool finished = false;

	while (!finished)
	{
		finished = true;

		for (int i = 0; i < height; ++i)
		{
			for (int j = 0; j < width; ++j)
			{
				center = i * width + j;
				stridedCenter = 8 * center;

				if (inDegreeMatrix[center] == 0)
				{
					finished = false;
					inDegreeMatrix[center] = 0xFF;

					newFlow = 0.0f;
					flowRevDir = flowRevDirs[center];

					if (flowRevDir & 1)   newFlow += flowFracs[stridedCenter + 0] * flowAcc[center - width];
					if (flowRevDir & 2)   newFlow += flowFracs[stridedCenter + 1] * flowAcc[center - width + 1];
					if (flowRevDir & 4)   newFlow += flowFracs[stridedCenter + 2] * flowAcc[center + 1];
					if (flowRevDir & 8)   newFlow += flowFracs[stridedCenter + 3] * flowAcc[center + width + 1];
					if (flowRevDir & 16)  newFlow += flowFracs[stridedCenter + 4] * flowAcc[center + width];
					if (flowRevDir & 32)  newFlow += flowFracs[stridedCenter + 5] * flowAcc[center + width - 1];
					if (flowRevDir & 64)  newFlow += flowFracs[stridedCenter + 6] * flowAcc[center - 1];
					if (flowRevDir & 128) newFlow += flowFracs[stridedCenter + 7] * flowAcc[center - width - 1];

					flowAcc[center] += newFlow;

					flowDir = flowDirs[center];

					if (flowDir & 1)   --inDegreeMatrix[center - width];
					if (flowDir & 2)   --inDegreeMatrix[center - width + 1];
					if (flowDir & 4)   --inDegreeMatrix[center + 1];
					if (flowDir & 8)   --inDegreeMatrix[center + width + 1];
					if (flowDir & 16)  --inDegreeMatrix[center + width];
					if (flowDir & 32)  --inDegreeMatrix[center + width - 1];
					if (flowDir & 64)  --inDegreeMatrix[center - 1];
					if (flowDir & 128) --inDegreeMatrix[center - width - 1];
				}
			}
		}
	}

	delete[] inDegreeMatrix;

	delete[] flowDirs;
	delete[] flowRevDirs;

	delete[] flowFracs;
}

void FlowAccumulationG_CPU_MT(
	float* flowAcc,
	float* wDEM,
	int width,
	int height,
	float cellSize,
	int numThreads)
{
	int length = width * height;

	int* inDegreeMatrix = new int[length];

	unsigned char* flowDirs = new unsigned char[length];
	unsigned char* flowRevDirs = new unsigned char[length];

	float* flowFracs = new float[length * 8];

	ComputeFlowDirections(wDEM, width, height, inDegreeMatrix, flowDirs, flowRevDirs);
	ComputeFlowFractions(wDEM, width, height, cellSize, flowFracs, true);

	for (int i = 0; i < length; ++i)
	{
		flowAcc[i] = 1.0f;
	}

	omp_set_num_threads(numThreads);

	int chunkSize = (height - 1) / numThreads + 1;

	#pragma omp parallel
	{
		int threadId = omp_get_thread_num();

		int lowerBound = threadId * chunkSize;
		int upperBound = (threadId + 1) * chunkSize - 1;

		upperBound = upperBound >= height ? height - 1 : upperBound;

		float newFlow;

		unsigned char flowDir;
		unsigned char flowRevDir;

		int center;
		int stridedCenter;

		bool finished = false;

		while (!finished)
		{
			finished = true;

			for (int i = lowerBound; i <= upperBound; ++i)
			{
				for (int j = 0; j < width; ++j)
				{
					center = i * width + j;
					stridedCenter = 8 * center;

					if (inDegreeMatrix[center] == 0)
					{
						finished = false;
						inDegreeMatrix[center] = 0xFF;

						newFlow = 0.0f;
						flowRevDir = flowRevDirs[center];

						if (flowRevDir & 1)   newFlow += flowFracs[stridedCenter + 0] * flowAcc[center - width];
						if (flowRevDir & 2)   newFlow += flowFracs[stridedCenter + 1] * flowAcc[center - width + 1];
						if (flowRevDir & 4)   newFlow += flowFracs[stridedCenter + 2] * flowAcc[center + 1];
						if (flowRevDir & 8)   newFlow += flowFracs[stridedCenter + 3] * flowAcc[center + width + 1];
						if (flowRevDir & 16)  newFlow += flowFracs[stridedCenter + 4] * flowAcc[center + width];
						if (flowRevDir & 32)  newFlow += flowFracs[stridedCenter + 5] * flowAcc[center + width - 1];
						if (flowRevDir & 64)  newFlow += flowFracs[stridedCenter + 6] * flowAcc[center - 1];
						if (flowRevDir & 128) newFlow += flowFracs[stridedCenter + 7] * flowAcc[center - width - 1];

						flowAcc[center] += newFlow;

						flowDir = flowDirs[center];

						if (flowDir & 1)
						{
							#pragma omp atomic
								--inDegreeMatrix[center - width];
						}

						if (flowDir & 2)
						{
							#pragma omp atomic
								--inDegreeMatrix[center - width + 1];
						}

						if (flowDir & 4)
						{
							#pragma omp atomic
								--inDegreeMatrix[center + 1];
						}

						if (flowDir & 8)
						{
							#pragma omp atomic
								--inDegreeMatrix[center + width + 1];
						}

						if (flowDir & 16)
						{
							#pragma omp atomic
								--inDegreeMatrix[center + width];
						}

						if (flowDir & 32)
						{
							#pragma omp atomic
								--inDegreeMatrix[center + width - 1];
						}

						if (flowDir & 64)
						{
							#pragma omp atomic
								--inDegreeMatrix[center - 1];
						}

						if (flowDir & 128)
						{
							#pragma omp atomic
								--inDegreeMatrix[center - width - 1];
						}
					}
				}
			}
		}
	}

	delete[] inDegreeMatrix;

	delete[] flowDirs;
	delete[] flowRevDirs;

	delete[] flowFracs;
}

//// GPU IMPLEMENTATIONS (M : Flow-Transfer-Matrix, G : Graph-Based) //////////////////////////////

void FlowAccumulationM_GPU(
	float* flowAcc,
	float* wDEM,
	int width,
	int height,
	float cellSize)
{
	int length = width * height;

	float* flowFracs = new float[length * 8];
	unsigned char* flowRevDirs = new unsigned char[length];

	ComputeFlowDirections(wDEM, width, height, NULL, NULL, flowRevDirs);
	ComputeFlowFractions(wDEM, width, height, cellSize, flowFracs, false);

	float* flow = new float[length];

	for (int i = 0; i < length; ++i)
	{
		flowAcc[i] = flow[i] = 1.0f;
	}

	bool finished = false;

	float* d_flowAcc;

	unsigned char* d_flowRevDirs;
	float* d_flowFracs;

	float* d_flow1;
	float* d_flow2;

	bool* d_pFinished;

	cudaMalloc((void**)&d_flowAcc, length * sizeof(float));

	cudaMalloc((void**)&d_flowFracs, length * 8 * sizeof(float));
	cudaMalloc((void**)&d_flowRevDirs, length * sizeof(unsigned char));

	cudaMalloc((void**)&d_flow1, length * sizeof(float));
	cudaMalloc((void**)&d_flow2, length * sizeof(float));

	cudaMalloc((void**)&d_pFinished, sizeof(bool));

	cudaMemcpy(d_flowAcc, flowAcc, length * sizeof(float), cudaMemcpyHostToDevice);

	cudaMemcpy(d_flowFracs, flowFracs, length * 8 * sizeof(float), cudaMemcpyHostToDevice);
	cudaMemcpy(d_flowRevDirs, flowRevDirs, length * sizeof(unsigned char), cudaMemcpyHostToDevice);

	cudaMemcpy(d_flow1, flow, length * sizeof(float), cudaMemcpyHostToDevice);

	dim3 dimGrid((width - 1) / BLOCK_WIDTH + 1, (height - 1) / BLOCK_WIDTH + 1);
	dim3 dimBlock(BLOCK_WIDTH, BLOCK_WIDTH);

	bool oldNewFlag = true;

	while (!finished)
	{
		finished = true;
		cudaMemcpy(d_pFinished, &finished, sizeof(bool), cudaMemcpyHostToDevice);

		if (oldNewFlag)
		{
			FlowAccumulationKernelM_Wrapper(dimGrid, dimBlock,
				d_flow1, d_flow2, d_flowAcc, d_flowFracs, d_flowRevDirs, width, height, d_pFinished);
		}
		else
		{
			FlowAccumulationKernelM_Wrapper(dimGrid, dimBlock,
				d_flow2, d_flow1, d_flowAcc, d_flowFracs, d_flowRevDirs, width, height, d_pFinished);
		}

		cudaDeviceSynchronize();
		cudaMemcpy(&finished, d_pFinished, sizeof(bool), cudaMemcpyDeviceToHost);

		oldNewFlag = !oldNewFlag;
	}

	cudaMemcpy(flowAcc, d_flowAcc, length * sizeof(float), cudaMemcpyDeviceToHost);

	cudaFree(d_flowAcc);

	cudaFree(d_flowRevDirs);
	cudaFree(d_flowFracs);

	cudaFree(d_flow1);
	cudaFree(d_flow2);

	cudaFree(d_pFinished);

	delete[] flowRevDirs;
	delete[] flowFracs;
	delete[] flow;
}

void FlowAccumulationG_GPU(
	float* flowAcc,
	float* wDEM,
	int width,
	int height,
	float cellSize)
{
	int length = width * height;

	int* inDegreeMatrix = new int[length];

	unsigned char* flowDirs = new unsigned char[length];
	unsigned char* flowRevDirs = new unsigned char[length];

	float* flowFracs = new float[length * 8];

	ComputeFlowDirections(wDEM, width, height, inDegreeMatrix, flowDirs, flowRevDirs);
	ComputeFlowFractions(wDEM, width, height, cellSize, flowFracs, false);

	for (int i = 0; i < length; ++i)
	{
		flowAcc[i] = 1.0f;
	}

	bool finished = false;

	float* d_flowAcc;

	int* d_inDegreeMatrix;

	unsigned char* d_flowDirs;
	unsigned char* d_flowRevDirs;

	float* d_flowFracs;

	bool* d_pFinished;

	cudaMalloc((void**)&d_flowAcc, length * sizeof(float));

	cudaMalloc((void**)&d_inDegreeMatrix, length * sizeof(int));

	cudaMalloc((void**)&d_flowDirs, length * sizeof(unsigned char));
	cudaMalloc((void**)&d_flowRevDirs, length * sizeof(unsigned char));

	cudaMalloc((void**)&d_flowFracs, length * 8 * sizeof(float));

	cudaMalloc((void**)&d_pFinished, sizeof(bool));

	cudaMemcpy(d_flowAcc, flowAcc, length * sizeof(float), cudaMemcpyHostToDevice);

	cudaMemcpy(d_inDegreeMatrix, inDegreeMatrix, length * sizeof(int), cudaMemcpyHostToDevice);

	cudaMemcpy(d_flowDirs, flowDirs, length * sizeof(unsigned char), cudaMemcpyHostToDevice);
	cudaMemcpy(d_flowRevDirs, flowRevDirs, length * sizeof(unsigned char), cudaMemcpyHostToDevice);

	cudaMemcpy(d_flowFracs, flowFracs, length * 8 * sizeof(float), cudaMemcpyHostToDevice);

	dim3 dimGrid((width - 1) / BLOCK_WIDTH + 1, (height - 1) / BLOCK_WIDTH + 1);
	dim3 dimBlock(BLOCK_WIDTH, BLOCK_WIDTH);

	while (!finished)
	{
		finished = true;
		cudaMemcpy(d_pFinished, &finished, sizeof(bool), cudaMemcpyHostToDevice);

		FlowAccumulationKernelG_Wrapper(dimGrid, dimBlock,
			d_flowAcc, d_flowFracs, d_flowDirs, d_flowRevDirs, d_inDegreeMatrix, width, height, d_pFinished);

		cudaDeviceSynchronize();
		cudaMemcpy(&finished, d_pFinished, sizeof(bool), cudaMemcpyDeviceToHost);
	}

	cudaMemcpy(flowAcc, d_flowAcc, length * sizeof(float), cudaMemcpyDeviceToHost);

	cudaFree(d_flowAcc);

	cudaFree(inDegreeMatrix);

	cudaFree(d_flowDirs);
	cudaFree(d_flowRevDirs);

	cudaFree(d_flowFracs);

	cudaFree(d_pFinished);

	delete[] inDegreeMatrix;

	delete[] flowDirs;
	delete[] flowRevDirs;

	delete[] flowFracs;
}

///////////////////////////////////////////////////////////////////////////////////////////////////

#endif // __FLOW_ACCUMULATION_H__

