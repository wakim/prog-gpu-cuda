################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../generator/number_generator.cpp 

OBJS += \
./generator/number_generator.o 

CPP_DEPS += \
./generator/number_generator.d 


# Each subdirectory must supply rules for building sources it contributes
generator/%.o: ../generator/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: NVCC Compiler'
	nvcc -G -g -O0 -gencode arch=compute_20,code=sm_20 -gencode arch=compute_20,code=sm_21 -odir "generator" -M -o "$(@:%.o=%.d)" "$<"
	nvcc -G -g -O0 --compile  -x c++ -o  "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


