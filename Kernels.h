
#ifndef __KERNELS_H__
#define __KERNELS_H__

//// KERNEL WRAPPERS //////////////////////////////////////////////////////////////////////////////

#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#define BLOCK_WIDTH   16

#define I_BLOCK_WIDTH 16
#define O_BLOCK_WIDTH 14

//// DEPRESSION FILLING ///////////////////////////////////////////////////////////////////////////

void DepressionFillingKernel_Wrapper(dim3 dimGrid, dim3 dimBlock,
	float* wDEM,
	float* zDEM,
	int width,
	int height,
	float epsilon,
	bool* pFinished);

//// FLOW-TRANSFER-MATRIX FLOW ACCUMULATION ///////////////////////////////////////////////////////

void FlowAccumulationKernelM_Wrapper(dim3 dimGrid, dim3 dimBlock,
	float* flowOld,
	float* flowNew,
	float* flowAcc,
	float* flowFracs,
	unsigned char* flowRevDirs,
	int width,
	int height,
	bool* pFinished);

//// GRAPH-BASED FLOW ACCUMULATION ////////////////////////////////////////////////////////////////

void FlowAccumulationKernelG_Wrapper(dim3 dimGrid, dim3 dimBlock,
	float* flowAcc,
	float* flowFracs,
	unsigned char* flowDirs,
	unsigned char* flowRevDirs,
	int* inDegreeMatrix,
	int width,
	int height,
	bool* pFinished);

///////////////////////////////////////////////////////////////////////////////////////////////////

#endif // __KERNELS_H__

