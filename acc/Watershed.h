#include "math.h"
#include "iostream"
#include "fstream"
#include "stdio.h"
#include "cpl_conv.h"
#include "gdal_priv.h"


#include "MeterPU.h"
#define GPU_0 0
using namespace MeterPU;

using namespace std;


void WaterCovering(float* wDEM, float* zDEM, int width, int height, float epsilon)
{
    int center;
    float demCenter, demNeighbor;
    int finished = 0;
    int size = width * height;

    #pragma acc data present(wDEM[:size], zDEM[:size])
    {
        #pragma acc parallel loop collapse(2)
        for (int i = 1; i < height - 1; i++)
        {
            for (int j = 1; j < width - 1; j++)
            {
                wDEM[i*width + j] = 1000000.0f;
            }
        }

        while (finished != 1)
        {
            finished = 1;

            #pragma acc kernels
            #pragma acc loop collapse(2) independent reduction(min: finished)
            for (int i = 1; i < height - 1; i++)
            {
                for (int j = 1; j < width - 1; j++)
                {
                    center = i*width + j;
                    demCenter = zDEM[center];

                    if(wDEM[center] <= zDEM[center])
                        continue;

                    for (int k = i - 1; k <= i + 1; k++)
                    {
                        for (int l = j - 1; l <= j + 1; l++)
                        {
                            if(/*k>=0 && k<height && l>=0 && l<width && */!(k==i && l==j))

                                if (zDEM[i*width+j] >= wDEM[k*width+l] + epsilon)
                                {
                                    wDEM[i*width + j] = zDEM[i*width + j];
                                    finished = 0;
                                }
                                else
                                {
                                    if (wDEM[i*width + j] > wDEM[k*width + l] + epsilon)
                                    {
                                        wDEM[i*width + j] = wDEM[k*width + l] + epsilon;
                                        finished = 0;
                                    }
                                }
                        }
                    }
                }
            }
        }
    }
}

void GenerateFlowDirections(float* wDEM, char** RMFD,  int width, int height)
{
    int size = width * height;

    #pragma acc data present(wDEM[:size], RMFD[:height][:width])
    {
        #pragma acc parallel loop collapse(2)
        for (int i = 0; i < height; i++)
        {
            for (int j = 0; j < width; j++)
            {
                RMFD[i][j] = 0;

                if (j - 1 >= 0 && wDEM[i*width + j] < wDEM[i*width + j - 1])
                    RMFD[i][j] |= 1;
                if (i - 1 >= 0 && j - 1 >= 0 && wDEM[i*width + j] < wDEM[(i - 1)*width + j - 1])
                    RMFD[i][j] |= 2;
                if (i - 1 >= 0 && wDEM[i*width + j] < wDEM[(i - 1)*width + j])
                    RMFD[i][j] |= 4;
                if (i - 1 >= 0 && j + 1 < width && wDEM[i*width + j] < wDEM[(i - 1)*width + j + 1])
                    RMFD[i][j] |= 8;
                if (j + 1 < width && wDEM[i*width + j] < wDEM[i*width + j + 1])
                    RMFD[i][j] |= 16;
                if (i + 1 < height && j + 1 < width && wDEM[i*width + j] < wDEM[(i + 1)*width + j + 1])
                    RMFD[i][j] |= 32;
                if (i + 1 < height && wDEM[i*width + j] < wDEM[(i + 1)*width + j])
                    RMFD[i][j] |= 64;
                if (i + 1 < height && j - 1 >= 0 && wDEM[i*width + j] < wDEM[(i + 1)*width + j - 1])
                    RMFD[i][j] |= 128;
            }
        }
    }
}

void GenerateIndegreeMatrix(float* wDEM, int* indegreeMatrix, int width, int height)
{
    int size = width * height;
    float demCenter;
    int indegree;
    int  center;

   #pragma acc data present(wDEM[:size], indegreeMatrix[:size])
   #pragma acc parallel loop collapse(2)
   for(int i=0; i<height; i++)
   {
       for(int j=0; j<width; j++)
       {
           demCenter = wDEM[i*width + j];
           indegree = 0;

           if (j - 1 >= 0 && demCenter < wDEM[i*width + j - 1])
               indegree++;

           if (i - 1 >= 0 && j - 1 >= 0 && demCenter < wDEM[(i - 1)*width + j - 1])
               indegree++;

           if (i - 1 >= 0 && demCenter < wDEM[(i - 1)*width + j])
              indegree++;

           if (i - 1 >= 0 && j + 1 < width && demCenter < wDEM[(i - 1)*width + j + 1])
               indegree++;

           if (j + 1 < width && demCenter < wDEM[i*width + j + 1])
              indegree++;

           if (i + 1 < height && j + 1 < width && demCenter < wDEM[(i + 1)*width + j + 1])
               indegree++;

           if (i + 1 < height && demCenter < wDEM[(i + 1)*width + j])
               indegree++;

           if (i + 1 < height && j - 1 >= 0 && demCenter < wDEM[(i + 1)*width + j - 1])
               indegree++;


           indegreeMatrix[i*width + j] = indegree;
       }
   }
}

void GenerateDirections(float* wDEM, char** DIR, int width, int height)
{
    int size = width * height;

    #pragma acc data present(wDEM[:size], DIR[:height][:width])
    #pragma acc parallel loop collapse(2) independent
    for (int i = 0; i < height; i++)
    {
        for (int j = 0; j < width; j++)
        {
            DIR[i][j] = 0;

            if (j - 1 >= 0 && wDEM[i*width + j] > wDEM[i*width + j - 1])
                DIR[i][j] |= 1;

            if (i - 1 >= 0 && j - 1 >= 0 && wDEM[i*width + j] > wDEM[(i - 1)*width + j - 1])
                DIR[i][j] |= 2;

            if (i - 1 >= 0 && wDEM[i*width + j] > wDEM[(i - 1)*width + j])
                DIR[i][j] |= 4;

            if (i - 1 >= 0 && j + 1 < width && wDEM[i*width + j] > wDEM[(i - 1)*width + j + 1])
                DIR[i][j] |= 8;

            if (j + 1 < width && wDEM[i*width + j] > wDEM[i*width + j + 1])
                DIR[i][j] |= 16;

            if (i + 1 < height && j + 1 < width && wDEM[i*width + j] > wDEM[(i + 1)*width + j + 1])
                DIR[i][j] |= 32;

            if (i + 1 < height && wDEM[i*width + j] > wDEM[(i + 1)*width + j])
                DIR[i][j] |= 64;

            if (i + 1 < height && j - 1 >= 0 && wDEM[i*width + j] > wDEM[(i + 1)*width + j - 1])
                DIR[i][j] |= 128;
        }
    }
}

void GenerateFlowFractions(float* wDEM, char** RMFD, float* flowFractions, float cellSize, int width, int height)
{
    float downslope, downslopeSum, maxDownslope, p;
    float demCenter, demNeighbor;
    float cellDistance;
    float root2 = sqrt(2.0f);
    float flowFraction;
    float Li;
    int isOutlet;
    int size = width * height;
    int size1 = size * 8;

    #pragma acc data present(wDEM[:size], RMFD[:height][:width], flowFractions[:size1])
    {
        #pragma acc parallel loop collapse(2)
        for (int i = 0; i < height; i++)
        {
            for (int j = 0; j < width; j++)
            {
                demCenter = wDEM[i*width + j];

                maxDownslope = 0;
                downslopeSum = 0;

                isOutlet = 1;

                for (int k = i - 1; k <= i + 1; k++)
                {
                    for (int l = j - 1; l <= j + 1; l++)
                    {
                        if (k >= 0 && k < height && l >= 0 && l < width && (k != i || l != j))
                        {
                            demNeighbor = wDEM[k*width + l];

                            if (demCenter > demNeighbor)
                            {
                                cellDistance = cellSize * ((k != i && l != j) ? root2 : 1);
                                downslope = (demCenter - demNeighbor) / cellDistance;
                                maxDownslope = fmax(maxDownslope, downslope);

                                isOutlet = 0;
                            }
                        }
                    }
                }

                if(isOutlet == 0)
                {
                    p = 8.9f * fmin(1.0f, maxDownslope) + 1.1f;


                    for (int k = i - 1; k <= i + 1; k++)
                    {
                        for (int l = j - 1; l <= j + 1; l++)
                        {
                            if (k >= 0 && k < height && l >= 0 && l < width && (k != i || l != j))
                            {
                                demNeighbor = wDEM[k*width + l];

                                if (demCenter > demNeighbor)
                                {
                                    cellDistance = cellSize * ((k != i && l != j) ? root2 : 1);
                                    downslope = (demCenter - demNeighbor) / cellDistance;
                                    Li = (k == i || l == j) ? 0.5f : 0.354f;
                                    downslopeSum += powf(downslope, p) * Li;
                                }
                            }
                        }
                    }

                    for (int k = i - 1; k <= i + 1; k++)
                    {
                        for (int l = j - 1; l <= j + 1; l++)
                        {
                            if (k >= 0 && k < height && l >= 0 && l < width && (k != i || l != j))
                            {
                                demNeighbor = wDEM[k*width + l];

                                if (demCenter > demNeighbor)
                                {
                                    //float aa, bb, cc;
                                    cellDistance = cellSize * ((k != i && l != j) ? root2 : 1);
                                    //aa = cellDistance;
                                    downslope = (demCenter - demNeighbor) / cellDistance;
                                    //bb = downslope;
                                    Li = (k != i && l != j) ?  0.354f : 0.5f;
                                    downslope = powf(downslope, p) * Li;
                                    //cc = downslope;
                                    flowFraction = downslope / downslopeSum;


                                    int index;
                                    if (k == i && l == j + 1)
                                        index = 0;
                                    else if (k == i + 1 && l == j + 1)
                                        index = 1;
                                    else if (k == i + 1  && l == j)
                                        index = 2;
                                    else if (k == i + 1 && l == j - 1)
                                        index = 3;
                                    else if (k == i && l == j - 1)
                                        index = 4;
                                    else if (k == i - 1 && l == j - 1)
                                        index = 5;
                                    else if (k == i - 1 && l == j)
                                        index = 6;
                                    else if (k == i - 1 && l == j + 1)
                                        index = 7;

                                    int arrayIndex = (k*width + l)*8 + index;
                                    flowFractions[arrayIndex] = flowFraction;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

void FlowAccumulation(float* wDEM, float* flowFractions, float* flowAccumulation, char** RMFD, int width, int height)
{
    int center, centerDem, neighborDem;
    float *oldFlow, *newFlow;
    int length = width * height;
    int size1 = length * 8;
    int stop = 1;
    oldFlow = new float[length];
    newFlow = new float[length];
    int iteration = 0;


    #pragma acc data create(oldFlow[:length], newFlow[:length]) present(wDEM[:length], flowFractions[:size1], RMFD[:height][:width], flowAccumulation[:length])
    {
        #pragma acc parallel loop
        for (int i = 0; i<length; i++)
        {
            oldFlow[i] = 1.0f;
            newFlow[i] = 1.0f;
            flowAccumulation[i] = 1.0f;
        }

        do {
            stop = 1;

            #pragma acc kernels
            #pragma acc loop collapse(2) independent reduction(min : stop)
            for (int i = 0; i<height; i++)
            {
                for (int j = 0; j<width; j++)
                {
                    center = i*width + j;
                    if (oldFlow[center] == 0)
                    {
                        newFlow[center] = 0;
                    }
                    else
                    {
                        float accu = 0;
                        char revDir = RMFD[i][j];
                        int index = (i*width+j)*8;

                        if (revDir & 1)
                            accu += oldFlow[i*width + j - 1] * flowFractions[index+0];

                        if (revDir & 2)
                            accu += oldFlow[(i - 1)*width+ j - 1] * flowFractions[index+1];

                        if (revDir & 4)
                            accu += oldFlow[(i - 1)*width+j] * flowFractions[index+2];

                        if (revDir & 8)
                            accu += oldFlow[(i - 1)*width+ j + 1] * flowFractions[index+3];

                        if (revDir & 16)
                            accu += oldFlow[i*width+j + 1] * flowFractions[index+4];

                        if (revDir & 32)
                            accu += oldFlow[(i + 1)*width+j + 1] * flowFractions[index+5];

                        if (revDir & 64)
                            accu += oldFlow[(i + 1)*width+j] * flowFractions[index+6];

                        if (revDir & 128)
                            accu += oldFlow[(i + 1)*width+j - 1] * flowFractions[index+7];

                        if (accu > 0)
                        {
                            flowAccumulation[center] += accu;
                            newFlow[center] = accu;
                            stop = 0;
                        }
                        else
                        {
                            newFlow[center] = 0;
                        }
                    }

                }
            }

            #pragma acc parallel loop
            for (int i = 0; i<length; i++)
            {
                oldFlow[i] = newFlow[i];
                newFlow[i] = 0;

            }

        } while (stop == 0);
    }

    delete oldFlow;
    delete newFlow;
}

void FlowAccumulation_GBA(float* wDEM, float* flowFractions, float* flowAccumulation, char** RMFD, char** DIR, int* indegreeMatrix, int width, int height)
{

    int length = width*height;
    int size1 = length * 8;
    int iteration = 0;

    #pragma acc data present(wDEM[:length], flowFractions[:size1], RMFD[:height][:width],DIR[:height][:width], flowAccumulation[:length], indegreeMatrix[:length])
    {
        #pragma acc parallel loop
        for(int i=0; i<length; i++)
        {
            flowAccumulation[i] = 1.0f;
        }

        int stop = 1;
        do
        {
            stop = 1;

            #pragma acc kernels
            #pragma acc loop collapse(2) independent reduction(min : stop)
            for(int i=0; i<height; i++)
            {
                for(int j=0; j<width; j++)
                {
                    int center = i*width+j;
                    if(indegreeMatrix[center] == 0)
                    {
                        indegreeMatrix[center] = -1;
                        float accu = 0;
                        char revDir = RMFD[i][j];

                        int index = (i*width+j)*8;

                        if (revDir & 1)
                            accu += flowAccumulation[i*width + j - 1] * flowFractions[index+0];

                        if (revDir & 2)
                            accu += flowAccumulation[(i - 1)*width+ j - 1] * flowFractions[index+1];

                        if (revDir & 4)
                            accu += flowAccumulation[(i - 1)*width+j] * flowFractions[index+2];

                        if (revDir & 8)
                            accu += flowAccumulation[(i - 1)*width+ j + 1] * flowFractions[index+3];

                        if (revDir & 16)
                            accu += flowAccumulation[i*width+j + 1] * flowFractions[index+4];

                        if (revDir & 32)
                            accu += flowAccumulation[(i + 1)*width+j + 1] * flowFractions[index+5];

                        if (revDir & 64)
                            accu += flowAccumulation[(i + 1)*width+j] * flowFractions[index+6];

                        if (revDir & 128)
                            accu += flowAccumulation[(i + 1)*width+j - 1] * flowFractions[index+7];

                        flowAccumulation[i*width + j] += accu;

                        int dir = DIR[i][j];

                        if (dir & 1)
                        {
                            #pragma acc atomic update
                            --indegreeMatrix[i*width + j - 1];
                        }

                        if (dir & 2)
                        {
                            #pragma acc atomic update
                            --indegreeMatrix[(i - 1)*width+ j - 1];
                        }

                        if (dir & 4)
                        {
                            #pragma acc atomic update
                            --indegreeMatrix[(i - 1)*width+j];
                        }


                        if (dir & 8)
                        {
                            #pragma  acc atomic update
                            --indegreeMatrix[(i - 1)*width+ j + 1];
                        }


                        if (dir & 16)
                        {
                            #pragma acc atomic update
                            --indegreeMatrix[i*width+j + 1];
                        }


                        if (dir & 32)
                        {
                            #pragma acc atomic update
                            --indegreeMatrix[(i + 1)*width+j + 1];
                        }


                        if (dir & 64)
                        {
                            #pragma acc atomic update
                            --indegreeMatrix[(i + 1)*width  +j];
                        }


                        if (dir & 128)
                        {
                            #pragma acc atomic update
                            --indegreeMatrix[(i + 1)*width+j - 1];
                        }



                        stop = 0;
                    }
                }
            }
        }
        while(stop == 0);
    }
}


float* ReadRasterData(char* filePath, int* width, int* height, int* cellSize)
{
    GDALAllRegister();
    GDALDataset* poDataset;

    poDataset = (GDALDataset*)GDALOpen(filePath, GA_ReadOnly);
    if (poDataset == NULL)
    {
        printf("Error on opening file.\n");
        return NULL;
    }

    //Fetching a Raster Band
    //GDALRasterBandH hBand;
    int nBlockXSize, nBlockYSize;
    int bGotMin, bGotMax;
    double adfMinMAx[2];

    //hBand = GDALGetRasterBand(hDataSet, 1);
    GDALRasterBand *poBand;
    poBand = poDataset->GetRasterBand(1);
    //GDALGetBlockSize(hBand, &nBlockXSize, &nBlockYSize);
    nBlockXSize = poDataset->GetRasterXSize();
    nBlockYSize = poDataset->GetRasterCount();

    //Get cell size
    double transform[9];
    //GDALGetGeoTransform(hDataSet, transform);
    poDataset->GetGeoTransform(transform);
    int cSize = sqrt(fabs(transform[1]) * fabs(transform[5]));
    printf("Cell size is %d.\n", cSize);
    *cellSize = cSize;

    //Reading Raster Data
    float* pafScanline;
    int nXSize;// = GDALGetRasterBandXSize(hBand);
    int nYSize;// = GDALGetRasterBandYSize(hBand);
    //poBand->GetBlockSize(&nXSize, &nYSize);
    nXSize = poBand->GetXSize();
    nYSize = poBand->GetYSize();
    int size = nXSize * nYSize;

    *width = nXSize;
    *height = nYSize;


    //printf("X size is %d.\n", nXSize);
    std::cout << "X size is " << nXSize << std::endl;
    //printf("Y size is %d.\n", nYSize);
    std::cout << "Y size is " << nYSize <<std::endl;

    pafScanline = (float*)CPLMalloc(size * sizeof(float));
    //GDALRasterIO(hBand, GF_Read, 0, 0, nXSize, nYSize, pafScanline, nXSize, nYSize, GDT_Float32, 0, 0);
    poBand->RasterIO(GF_Read, 0, 0, nXSize, nYSize, pafScanline, nXSize, nYSize, GDT_Float32, 0, 0);


    GDALClose((GDALDatasetH)poDataset);

    return pafScanline;
}

void WriteFlowAccumulationModel(char* fileName, float* flowAccumulation, int width, int height)
{
    GDALAllRegister();

    //GDALDatasetH hDataSet;
    GDALDataset* poDataset;
    poDataset = (GDALDataset*)GDALOpen(fileName, GA_Update);

    //Fetching a Raster Band
    //GDALRasterBandH hBand;
    GDALRasterBand *poBand;
    poBand = poDataset->GetRasterBand(1);




    void* buffer = CPLMalloc(width * height * sizeof(float));
    memcpy(buffer, flowAccumulation, width * height * sizeof(float));

    poBand->RasterIO(GF_Write, 0, 0, width, height, buffer, width, height, GDT_Float32, 0, 0);


    CPLFree(buffer);
    GDALClose((GDALDatasetH)poDataset);
}

void CopyDataSet(char* originalFileName, char* copyFileName)
{
    GDALDataset* poDataset;
    poDataset = (GDALDataset*)GDALOpen(originalFileName, GA_Update);

    GDALDriver* driver = poDataset->GetDriver();

    driver->CopyFiles(copyFileName, originalFileName);

    GDALClose((GDALDatasetH)poDataset);
}

void WriteFlowAccumulationInTxt(char* txtFilePath, float* flowAccumulation, int width, int height)
{
    ofstream file;
    file.open(txtFilePath);

    for(int i=0; i<height; i++)
    {
        for(int j=0; j<width; j++)
        {
            file << "(" << i << "," << j << "): " << flowAccumulation[i*width + j] << endl;
        }
    }

    file.close();
}

void WriteFlowFractionsInTxt(char* txtFilePath, float* flowFractions, int width, int height)
{
    ofstream file;
    file.open(txtFilePath);

    for(int i=0; i<height; i++)
    {

        for(int j=0; j<width; j++)
        {
            for(int k=0; k<8; k++)
            {
                file << "(" << i << "," << j << ")" << "[" << k << "]: " << flowFractions[i*width + j + k] <<endl;
            }
        }
    }

    file.close();
}

// Funkcija koja učitava DEM modela i izvršava Watershed algoritam!
void testGdal(char* inputFile, char* outputFile)
{
    float *wDEM, *zDEM, *flowAccumulation;
    float* flowFractions;
    char** RMFD;
    int size, size1, width, height, cellSize;

#ifdef NVML_PROFILING
    Meter<NVML_Energy<GPU_0>> gpuMeter;
#endif
#ifdef CPU_TIME
    Meter<CPU_Time> timeMeter;
#endif
#ifdef ENABLE_PCM
    Meter<PCM_Energy> cpuEnergyMeter;
#endif
    //Read raster data
    zDEM = ReadRasterData(inputFile, &width, &height, &cellSize);
    size = width * height;
    size1 = size * 8;

    //Memory allocation
    wDEM = new float[size];
    flowAccumulation = new float[size];
    flowFractions = new float[size1];
    RMFD = new char*[height];
    for (int i = 0; i < height; i++)
    {

        RMFD[i] = new char[width];
    }


#ifdef NVML_PROFILING
    gpuMeter.start();
#endif
#ifdef CPU_TIME
    timeMeter.start();
#endif
#ifdef ENABLE_PCM
    cpuEnergyMeter.start();
#endif

    #pragma acc data create(wDEM[:size], RMFD[:height][:width], flowFractions[:size1])
    #pragma acc data copyin(zDEM[:size])
    #pragma acc data copyout(flowAccumulation[:size])
    {
        std::cout << "Starting Water covering algorithm." << std::endl;

        //Preprocessing DEM
        WaterCovering(wDEM, zDEM, width, height, 0.01);

        std::cout << "Ending Water covering algorithm." << std::endl;

        //GenerateFlowDirections
        GenerateFlowDirections(wDEM, RMFD, width, height);

        //Generate flow fractions
        GenerateFlowFractions(wDEM, RMFD, flowFractions, cellSize, width, height);

        std::cout << "Starting Flow accumulation algorithm." << std::endl;

        //Run flow accumulation algorithm
        FlowAccumulation(wDEM, flowFractions, flowAccumulation, RMFD, width, height);

        std::cout << "Ending Flow accumulation algorithm." << std::endl;
    }


    //Create copy of tif file in order to store the result
    CopyDataSet(inputFile, outputFile);

    //Copy new raster data into new tif fileName
    WriteFlowAccumulationModel(outputFile, flowAccumulation, width, height);

    //WriteFlowFractionsInTxt("/home/ramax/Desktop/acc_flow_fracs.txt", flowFractions, width, height);

    //WriteFlowAccumulationInTxt("/home/ramax/Desktop/dem_wdem_txt_acc.txt", wDEM, width, height);

    //WriteFlowAccumulationInTxt("/home/ramax/Desktop/acc_flow_accum.txt", flowAccumulation, width, height);



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


    delete wDEM;
    delete flowAccumulation;
    delete flowFractions;
    CPLFree(zDEM);

    for (int i = 0; i < height; i++)
    {
        delete RMFD[i];
    }

    delete [] RMFD;

}


void testGdalGBA(char* inputFile, char* outputFile)
{
    float *wDEM, *zDEM, *flowAccumulation;
    float* flowFractions;
    char** RMFD;
    char** DIR;
    int* indegreeMatrix;
    int size, size1, width, height, cellSize;


#ifdef PCM_BENCHMARK
    Meter<CPU_Time> meter;
    Meter<PCM_Energy> energyMeter;


    meter.start();
    energyMeter.start();
    //gpuEnergyMeter.start();
#endif
    //Read raster data
    zDEM = ReadRasterData(inputFile, &width, &height, &cellSize);
    size = width * height;
    size1 = size * 8;

    //Memory allocation
    wDEM = new float[size];
    flowAccumulation = new float[size];
    indegreeMatrix = new int[size];
    flowFractions = new float[size1];
    RMFD = new char*[height];
    DIR = new char*[height];
    for (int i = 0; i < height; i++)
    {

        RMFD[i] = new char[width];
        DIR[i] = new char[width];
    }

    #pragma acc data create(wDEM[:size], RMFD[:height][:width], DIR[:height][:width], indegreeMatrix[:size], flowFractions[:size1])
    #pragma acc data copyin(zDEM[:size])
    #pragma acc data copyout(flowAccumulation[:size])
    {
        std::cout << "Starting Water covering algorithm." << std::endl;

        //Preprocessing DEM
        WaterCovering(wDEM, zDEM, width, height, 0.01);

        std::cout << "Ending Water covering algorithm." << std::endl;

        //GenerateFlowDirections
        GenerateFlowDirections(wDEM, RMFD, width, height);

        std::cout << "Starting generating indegree matrix." << std::endl;

        GenerateIndegreeMatrix(wDEM, indegreeMatrix, width, height);

        std::cout << "Ending generating indegree matrix." << std::endl;

        std::cout << "Starting generating DIR matrix." << std::endl;

        GenerateDirections(wDEM, DIR, width, height);

        std::cout << "Ending generating DIR matrix." << std::endl;

        //Generate flow fractions
        GenerateFlowFractions(wDEM, RMFD, flowFractions, cellSize, width, height);

        std::cout << "Starting Flow accumulation algorithm." << std::endl;

        //Run flow accumulation algorithm
        FlowAccumulation_GBA(wDEM, flowFractions, flowAccumulation, RMFD, DIR, indegreeMatrix, width, height);

        //FlowAccumulation(wDEM, flowFractions, flowAccumulation, RMFD, width, height);

        std::cout << "Ending Flow accumulation algorithm." << std::endl;
    }


    //Create copy of tif file in order to store the result
    CopyDataSet(inputFile, outputFile);

    //Copy new raster data into new tif fileName
    WriteFlowAccumulationModel(outputFile, flowAccumulation, width, height);

#ifdef PCM_BENCHMARK
    meter.stop();
    energyMeter.stop();
    //gpuEnergyMeter.stop();

    meter.calc();
    energyMeter.calc();
    //gpuEnergyMeter.calc();
    std::cout<<"[CPU Time Meter] Time consumed is: "<<meter.get_value() / 1000000.0<<" seconds."<<std::endl;
    std::cout<<"Energy consumed is: "<< energyMeter.get_value() / 1000.0 <<" Joules."<<std::endl;
    //std::cout<<"GPU Energy consumed is: "<< gpuEnergyMeter.get_value() / 1000.0 <<" Joules."<<std::endl;
#endif
    //Memory deallocation

    delete wDEM;
    delete flowAccumulation;
    delete flowFractions;
    CPLFree(zDEM);

    for (int i = 0; i < height; i++)
    {
        delete RMFD[i];
    }

    delete [] RMFD;
}

