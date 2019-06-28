
#ifndef __WATERSHED_ANALYZER_H__
#define __WATERSHED_ANALYZER_H__

#include <string>

#include "gdal_priv.h"


enum EDevice
{
	eGPU = 0,    // GPU CUDA device
	eCPU_ST = 1, // CPU single-thread
	eCPU_MT = 2 // CPU multi-thread
};

enum EFlowAccAlgorithm
{
	eFTM = 0, // flow-transfer-matrix algorithm
	eGBA = 1  // graph-based algorithm
};
 
class CWatershedAnalyzer
{


public:
	CWatershedAnalyzer(std::string inputRasterPath, std::string outputRasterPath);
	~CWatershedAnalyzer();

public:
	void RunWatershedAnalysis(std::pair<long long /* depression filling time */,
		                                long long /* flow accumulation time */>* pElapsedTime);

	void SetInputRasterPath(std::string inputRasterPath);
	void SetOutputRasterPath(std::string outputRasterPath);

	void SetComputingDevice(EDevice device);
	void SetFlowAccAlgorithm(EFlowAccAlgorithm algorithm);

	void SetEpsilon(float epsilon);

private:
	GDALDataset* openRaster();

	long long depressionFilling(float* wDEM, float* zDEM, int width, int height);
	long long flowAccumulation(float* flowAcc, float* wDEM, int width, int height, float cellSize);
	void writeFlowFracInTxt(char*, float*, int, int);

private:
	std::string m_inputRasterPath;
	std::string m_outputRasterPath;

	EDevice m_computingDevice;
	EFlowAccAlgorithm m_flowAccAlgorithm;

	float m_epsilon; // depression filling parameter

	int m_numThreads; // number of CPU threads for multi-threaded implementations
};

#endif // __WATERSHED_ANALYZER_H__

