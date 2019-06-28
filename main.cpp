
#include <fstream>
#include <iostream>
#include <iomanip>
#include "stdlib.h"
#include "WatershedAnalyzer.h"
#include "MeterPU.h"

#define GPU_0 0

using namespace MeterPU;

struct SWatershedAnalysisArgs
{
	std::string inputRasterPath;
	std::string outputRasterPath;

	EDevice computingDevice;
	EFlowAccAlgorithm flowAccAlgorithm;

	float epsilon;

	bool valid;
	std::string errorMessage;

	SWatershedAnalysisArgs() { }
	SWatershedAnalysisArgs(int argc, char* argv[]);
};

int main(int argc, char* argv[])
{
	SWatershedAnalysisArgs args(argc, argv);
	#ifdef NVML_PROFILING
	Meter<NVML_Energy<GPU_0>> gpuMeter;
	#endif
	#ifdef CPU_TIME
	Meter<CPU_Time> timeMeter;
	#endif
	#ifdef ENABLE_PCM
	Meter<PCM_Energy> cpuEnergyMeter;
	#endif

	if (!args.valid)
	{
		std::cout << std::endl << args.errorMessage.c_str() << std::endl;
		exit(1);
	}

	std::pair<long long, long long> time;
	CWatershedAnalyzer analyzer(args.inputRasterPath, args.outputRasterPath);

	analyzer.SetEpsilon(args.epsilon);
	analyzer.SetComputingDevice(args.computingDevice);
	analyzer.SetFlowAccAlgorithm(args.flowAccAlgorithm);

	#ifdef NVML_PROFILING
	gpuMeter.start();
	#endif
	#ifdef CPU_TIME
	timeMeter.start();
	#endif
	#ifdef ENABLE_PCM
	cpuEnergyMeter.start();
	#endif


	analyzer.RunWatershedAnalysis(&time);

	std::cout << std::endl;


	std::cout << "------------------------------" << std::endl;
	std::cout << "Watershed analysis done!" << std::endl;
	std::cout << "------------------------------" << std::endl;
	std::cout << "Depression filling: " << std::setw(7) << time.first  << " ms" << std::endl;
	std::cout << "Flow accumulation:  " << std::setw(7) << time.second << " ms" << std::endl;
	std::cout << "------------------------------" << std::endl;
	std::cout << "Total time elapsed: " << std::setw(7) << time.first + time.second << " ms" << std::endl;
	std::cout << "------------------------------" << std::endl;

	std::cout << std::endl;

	#ifdef NVML_PROFILING
	gpuMeter.stop();
	gpuMeter.calc();
	std::cout << "Energy consumed by GPU is: " << gpuMeter.get_value() / 1000 << " Joules." << std::endl; 
	#endif
	#ifdef CPU_TIME
	timeMeter.stop();
	timeMeter.calc();
	std::cout << "Execution time is: " << timeMeter.get_value() / 1000000 << " seconds." << std::endl;
	#endif
	#ifdef ENABLE_PCM
    cpuEnergyMeter.stop();
    cpuEnergyMeter.calc();
    std::cout << "Energy consumed by CPU is: " << cpuEnergyMeter.get_value() / 1000 << " Joules." << std::endl;
	#endif

	return 0;
}

SWatershedAnalysisArgs::SWatershedAnalysisArgs(int argc, char* argv[])
{
	valid = false;
	errorMessage = "Insufficient number of command-line arguments!";

	if (argc == 6)
	{
		valid = true;

		//// input and output filepath ////////////////////////////////////////////////////////////

		inputRasterPath = argv[1];
		outputRasterPath = argv[2];

		std::ifstream inputFile(argv[1]);//was inputRasterPath

		if (!inputFile.good())
		{
			valid = false;
			errorMessage = "Arg1: File does not exist!";
		}

		//// computing device /////////////////////////////////////////////////////////////////////

		std::string device(argv[3]);

		if (device.compare("gpu") == 0)
		{
			computingDevice = eGPU;
		}
		else if (device.compare("cpu_st") == 0)
		{
			computingDevice = eCPU_ST;
		}
		else if (device.compare("cpu_mt") == 0)
		{
			computingDevice = eCPU_MT;
		}
		else
		{
			valid = false;
			errorMessage = "Arg3: Computing device must be 'gpu', 'cpu_st' or 'cpu_mt'!";
		}

		//// flow accumulation algorithm //////////////////////////////////////////////////////////

		std::string algorithm(argv[4]);

		if (algorithm.compare("ftm") == 0)
		{
			flowAccAlgorithm = eFTM;
		}
		else if (algorithm.compare("gba") == 0)
		{
			flowAccAlgorithm = eGBA;
		}
		else
		{
			valid = false;
			errorMessage = "Arg4: Flow accumulation algorithm must be 'ftm' or 'gba'!";
		}

		//// depression filling epsilon parameter /////////////////////////////////////////////////

		try
		{
			epsilon = strtof(argv[5], NULL);
		}
		catch (const std::logic_error& exc)
		{
			valid = false;
			errorMessage = "Arg5: Depression filling 'epsilon' parameter must be a float number!";
		}

		//// //////////////////////////////////////////////////////////////////////////////////////
	}
}


