################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/classes/source/CudaMatrixProcessorImpl.cpp \
../src/classes/source/CudaMatrixProcessorTimed.cpp \
../src/classes/source/CudaTimer.cpp \
../src/classes/source/MatrixReader.cpp 

OBJS += \
./src/classes/source/CudaMatrixProcessorImpl.o \
./src/classes/source/CudaMatrixProcessorTimed.o \
./src/classes/source/CudaTimer.o \
./src/classes/source/MatrixReader.o 

CPP_DEPS += \
./src/classes/source/CudaMatrixProcessorImpl.d \
./src/classes/source/CudaMatrixProcessorTimed.d \
./src/classes/source/CudaTimer.d \
./src/classes/source/MatrixReader.d 


# Each subdirectory must supply rules for building sources it contributes
src/classes/source/%.o: ../src/classes/source/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: NVCC Compiler'
	nvcc -G -g -O0 -gencode arch=compute_20,code=sm_20 -gencode arch=compute_20,code=sm_21 -odir "src/classes/source" -M -o "$(@:%.o=%.d)" "$<"
	nvcc -lcudart -lcuda --keep -G -g -O0 --compile  -x c++ -o  "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


