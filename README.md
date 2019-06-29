# WatershedAnalysis
Watershed analysis algorithm implementation in CUDA and OpenACC



# Build docker file
#Ukoliko neko nije izbrisao image sa servera, može da se preskoči ovaj deo

nvidia-docker build --tag=cudawatershed .



# Run NVIDIA Docker image

nvidia-docker run -it --privileged cudawatershed



# Remove watch_dog flagto enable reading CPU status

echo '0' > /proc/sys/kernel/nmi_watchdog



# Run sequential (single core) OpenACC implementation 

./acc/acc_singlecore.exe ./TestData/dem1.tif dem1_acc_result.tif



# Run OpenACC implementation on multi-core CPU

./acc/acc_multicore.exe ./TestData/dem1.tif dem1_acc_result.tif



# Run OpenACC implementation on many-core GPU 

./acc/acc_gpu_35.exe ./TestData/dem1.tif dem1_acc_result.tif



# Run sequential (single core) implementation

./cuda_10.exe ./TestData/dem1.tif dem1_cuda_result.tif cpu_st ftm 0.01



# Run OpenMP implementation on multi-core CPU

./cuda_10.exe ./TestData/dem1.tif dem1_cuda_result.tif cpu_mt ftm 0.01



# Run CUDA implementation on many-core GPU

./cuda_10.exe ./TestData/dem1.tif dem1_cuda_result.tif gpu ftm 0.01



# Stop and remove Docker image

nvidia-docker rmi -f cudawatershed
