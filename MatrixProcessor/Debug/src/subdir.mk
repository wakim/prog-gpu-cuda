################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/DocumentMatrixProcessor.cpp 

OBJS += \
./src/DocumentMatrixProcessor.o 

CPP_DEPS += \
./src/DocumentMatrixProcessor.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: NVCC Compiler'
	nvcc -G -g -O0 -gencode arch=compute_20,code=sm_20 -gencode arch=compute_20,code=sm_21 -odir "src" -M -o "$(@:%.o=%.d)" "$<"
	nvcc -lcudart -lcuda --keep -G -g -O0 --compile  -x c++ -o  "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


