
#include "WatershedAnalyzer.h"

#include <fstream>

#include "DepressionFilling.h"
#include "FlowAccumulation.h"

using namespace std;


void CWatershedAnalyzer::writeFlowFracInTxt(char* filePath, float* flowAcc, int width, int height)
{
	ofstream file;
    file.open(filePath);

    for(int i=0; i<height; i++)
    {
        for(int j=0; j<width; j++)
        {
            file << "(" << i << "," << j << "): " << flowAcc[i*width + j] << endl;
        }
    }

    file.close();
}

CWatershedAnalyzer::CWatershedAnalyzer(std::string inputRasterPath, std::string outputRasterPath)
{
	m_inputRasterPath = inputRasterPath;
	m_outputRasterPath = outputRasterPath;

	m_computingDevice = eCPU_ST;
	m_flowAccAlgorithm = eGBA;

	m_epsilon = 0.01f;

	m_numThreads = omp_get_max_threads();

	GDALAllRegister();
}

CWatershedAnalyzer::~CWatershedAnalyzer()
{

}

void CWatershedAnalyzer::RunWatershedAnalysis(std::pair<long long, long long>* pElapsedTime)
{
	GDALDataset* pRasterDataset = this->openRaster();
	GDALRasterBand* pRasterBand = pRasterDataset->GetRasterBand(1);

	double transform[9];
	pRasterDataset->GetGeoTransform(transform);

	float cellSize = sqrt(abs(transform[1]) * abs(transform[5]));

	int width = pRasterBand->GetXSize();
	int height = pRasterBand->GetYSize();
	int length = width * height;

	float* zDEM = new float[length];
	float* wDEM = new float[length];

	float* flowAcc = new float[length];

	pRasterBand->RasterIO(GF_Read, 0, 0, width, height, zDEM, width, height, GDT_Float32, 0, 0);
	//memcpy(wDEM, zDEM, length * sizeof(float));

	pElapsedTime->first = this->depressionFilling(wDEM, zDEM, width, height);

	//pRasterBand->RasterIO(GF_Write, 0, 0, width, height, wDEM, width, height, GDT_Float32, 0, 0);
	pElapsedTime->second = this->flowAccumulation(flowAcc, wDEM, width, height, cellSize);

	pRasterBand->RasterIO(GF_Write, 0, 0, width, height, flowAcc, width, height, GDT_Float32, 0, 0);

	//writeFlowFracInTxt("/home/ramax/Desktop/cuda_flow_accum.txt", flowAcc, width, height);

	GDALClose(pRasterDataset);

	delete[] zDEM;
	delete[] wDEM;

	delete[] flowAcc;
}

void CWatershedAnalyzer::SetInputRasterPath(std::string inputRasterPath)
{
	m_inputRasterPath = inputRasterPath;
}

void CWatershedAnalyzer::SetOutputRasterPath(std::string outputRasterPath)
{
	m_outputRasterPath = outputRasterPath;
}

void CWatershedAnalyzer::SetComputingDevice(EDevice device)
{
	m_computingDevice = device;
}

void CWatershedAnalyzer::SetFlowAccAlgorithm(EFlowAccAlgorithm algorithm)
{
	m_flowAccAlgorithm = algorithm;
}

void CWatershedAnalyzer::SetEpsilon(float epsilon)
{
	m_epsilon = epsilon;
}

GDALDataset* CWatershedAnalyzer::openRaster()
{
	std::ifstream src(m_inputRasterPath.c_str(), std::ios::binary);
	std::ofstream dst(m_outputRasterPath.c_str(), std::ios::binary);

	dst << src.rdbuf();

	src.close();
	dst.close();

	return (GDALDataset*)GDALOpen(m_outputRasterPath.c_str(), GA_Update);
}

long long CWatershedAnalyzer::depressionFilling(float* wDEM, float* zDEM, int width, int height)
{
	double begin = omp_get_wtime();

	switch (m_computingDevice)
	{
		case eGPU:    DepressionFilling_GPU(wDEM, zDEM, width, height, m_epsilon); break;
		case eCPU_ST: DepressionFilling_CPU_ST(wDEM, zDEM, width, height, m_epsilon); break;
		case eCPU_MT: DepressionFilling_CPU_MT(wDEM, zDEM, width, height, m_epsilon, m_numThreads); break;
	}

	double end = omp_get_wtime();

	return (long long)(end - begin);
}

long long CWatershedAnalyzer::flowAccumulation(float* flowAcc, float* wDEM, int width, int height, float cellSize)
{
	double begin = omp_get_wtime();

	switch (m_computingDevice)
	{
		case eGPU:

			switch (m_flowAccAlgorithm)
			{
				case eGBA: FlowAccumulationG_GPU(flowAcc, wDEM, width, height, cellSize); break;
				case eFTM: FlowAccumulationM_GPU(flowAcc, wDEM, width, height, cellSize); break;
			}

			break;

		case eCPU_ST:

			switch (m_flowAccAlgorithm)
			{
				case eGBA: FlowAccumulationG_CPU_ST(flowAcc, wDEM, width, height, cellSize); break;
				case eFTM: FlowAccumulationM_CPU_ST(flowAcc, wDEM, width, height, cellSize); break;
			}

			break;

		case eCPU_MT:

			switch (m_flowAccAlgorithm)
			{
				case eGBA: FlowAccumulationG_CPU_MT(flowAcc, wDEM, width, height, cellSize, m_numThreads); break;
				case eFTM: FlowAccumulationM_CPU_MT(flowAcc, wDEM, width, height, cellSize, m_numThreads); break;
			}

			break;
	}

	double end = omp_get_wtime();

	return (long long)(end - begin);
}
