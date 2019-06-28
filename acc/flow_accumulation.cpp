#include "Watershed.h"
#include "iostream"
#include "math.h"
#include "stdio.h"
#include "stdlib.h"
#include "string.h"

int main(int argc, char* argv[])
{
    std::cout << "Input path: " << argv[1] << std::endl;
    std::cout << "Output path: " << argv[2] << std::endl;

    testGdal(argv[1], argv[2]);

    //testGdalGBA(argv[1], argv[2]);

}
