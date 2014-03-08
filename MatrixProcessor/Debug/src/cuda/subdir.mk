################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CU_SRCS += \
../src/cuda/kernels.cu 

CU_DEPS += \
./src/cuda/kernels.d 

OBJS += \
./src/cuda/kernels.o 


# Each subdirectory must supply rules for building sources it contributes
src/cuda/%.o: ../src/cuda/%.cu
	@echo 'Building file: $<'
	@echo 'Invoking: NVCC Compiler'
	nvcc -G -g -O0 -gencode arch=compute_20,code=sm_20 -gencode arch=compute_20,code=sm_21 -odir "src/cuda" -M -o "$(@:%.o=%.d)" "$<"
	nvcc -lcudart -lcuda --keep --compile -G -O0 -g -gencode arch=compute_20,code=compute_20 -gencode arch=compute_20,code=sm_21  -x cu -o  "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


