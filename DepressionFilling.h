
#ifndef __DEPRESSION_FILLING_H__
#define __DEPRESSION_FILLING_H__

//// DEPRESSION FILLING IMPLEMENTATIONS ///////////////////////////////////////////////////////////

#include <omp.h>

#include "Kernels.h"

//// CPU IMPLEMENTATIONS //////////////////////////////////////////////////////////////////////////

void DepressionFilling_CPU_ST(
	float* wDEM,
	float* zDEM,
	int width,
	int height,
	float epsilon)
{
	for (int i = 1; i < height - 1; ++i)
	{
		for (int j = 1; j < width - 1; ++j)
		{
			wDEM[i * width + j] = 1000000.0f;
		}
	}

	int center;
	float wDEMNeighbor;

	bool finished = false;

	while (!finished)
	{
		finished = true;

		for (int i = 1; i < height - 1; ++i)
		{
			for (int j = 1; j < width - 1; ++j)
			{
				center = i * width + j;

				if (wDEM[center] > zDEM[center])
				{
					for (int k = i - 1; k <= i + 1; ++k)
					{
						for (int l = j - 1; l <= j + 1; ++l)
						{
							if (k != i || l != j)
							{
								wDEMNeighbor = wDEM[k * width + l] + epsilon;

								if (zDEM[center] >= wDEMNeighbor)
								{
									wDEM[center] = zDEM[center];
									finished = false;
								}
								else
								{
									if (wDEM[center] > wDEMNeighbor)
									{
										wDEM[center] = wDEMNeighbor;
										finished = false;
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

void DepressionFilling_CPU_MT(
	float* wDEM,
	float* zDEM,
	int width,
	int height,
	float epsilon,
	int numThreads)
{
	for (int i = 1; i < height - 1; ++i)
	{
		for (int j = 1; j < width - 1; ++j)
		{
			wDEM[i * width + j] = 1000000.0f;
		}
	}

	bool finished = false;
	omp_set_num_threads(numThreads);

	#pragma omp parallel
	{
		int threadId = omp_get_thread_num();

		int center;
		float wDEMNeighbor;

		while (!finished)
		{
			#pragma omp barrier

			finished = true;

			for (int i = threadId + 1; i < height - 1; i += numThreads)
			{
				for (int j = 1; j < width - 1; ++j)
				{
					center = i * width + j;

					if (wDEM[center] > zDEM[center])
					{
						for (int k = i - 1; k <= i + 1; ++k)
						{
							for (int l = j - 1; l <= j + 1; ++l)
							{
								if (k != i || l != j)
								{
									wDEMNeighbor = wDEM[k * width + l] + epsilon;

									if (zDEM[center] >= wDEMNeighbor)
									{
										wDEM[center] = zDEM[center];
										finished = false;
									}
									else
									{
										if (wDEM[center] > wDEMNeighbor)
										{
											wDEM[center] = wDEMNeighbor;
											finished = false;
										}
									}
								}
							}
						}
					}
				}
			}

			#pragma omp barrier
		}
	}
}

//// GPU IMPLEMENTATION ///////////////////////////////////////////////////////////////////////////

void DepressionFilling_GPU(
	float* wDEM,
	float* zDEM,
	int width,
	int height,
	float epsilon)
{
	for (int i = 1; i < height - 1; ++i)
	{
		for (int j = 1; j < width - 1; ++j)
		{
			wDEM[i * width + j] = 1000000.0f;
		}
	}

	bool finished = false;

	int length = width * height;

	float* d_wDEM;
	float* d_zDEM;

	bool* d_pFinished;

	cudaMalloc((void**)&d_wDEM, length * sizeof(float));
	cudaMalloc((void**)&d_zDEM, length * sizeof(float));

	cudaMalloc((void**)&d_pFinished, sizeof(bool));

	cudaMemcpy(d_wDEM, wDEM, length * sizeof(float), cudaMemcpyHostToDevice);
	cudaMemcpy(d_zDEM, zDEM, length * sizeof(float), cudaMemcpyHostToDevice);

	dim3 dimGrid(((width - 2) - 1) / O_BLOCK_WIDTH + 1, ((height - 2) - 1) / O_BLOCK_WIDTH + 1);
	dim3 dimBlock(I_BLOCK_WIDTH, I_BLOCK_WIDTH);

	while (!finished)
	{
		finished = true;
		cudaMemcpy(d_pFinished, &finished, sizeof(bool), cudaMemcpyHostToDevice);

		DepressionFillingKernel_Wrapper(dimGrid, dimBlock,
			d_wDEM, d_zDEM, width, height, epsilon, d_pFinished);

		cudaDeviceSynchronize();
		cudaMemcpy(&finished, d_pFinished, sizeof(bool), cudaMemcpyDeviceToHost);
	}

	cudaMemcpy(wDEM, d_wDEM, length * sizeof(float), cudaMemcpyDeviceToHost);

	cudaFree(d_wDEM);
	cudaFree(d_zDEM);

	cudaFree(d_pFinished);
}

///////////////////////////////////////////////////////////////////////////////////////////////////

#endif // __DEPRESSION_FILLING_H__

