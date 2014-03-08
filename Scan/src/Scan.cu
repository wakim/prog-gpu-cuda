/**
 * Copyright 1993-2012 NVIDIA Corporation.  All rights reserved.
 *
 * Please refer to the NVIDIA end user license agreement (EULA) associated
 * with this source code for terms and conditions that govern your use of
 * this software. Any use, reproduction, disclosure, or distribution of
 * this software and related documentation outside the terms of the EULA
 * is strictly prohibited.
 */
#include <stdio.h>
#include <stdlib.h>

static const int VECTOR_SIZE = 32;
static const int WORK_SIZE = 16;

/**
 * This macro checks return value of the CUDA runtime call and exits
 * the application if the call failed.
 */
#define CUDA_CHECK_RETURN(value) {											\
	cudaError_t _m_cudaStat = value;										\
	if (_m_cudaStat != cudaSuccess) {										\
		fprintf(stderr, "Error %s at line %d in file %s\n",					\
				cudaGetErrorString(_m_cudaStat), __LINE__, __FILE__);		\
		exit(1);															\
	} }

__device__ int scan_warp(int *ptr, const unsigned int idx = threadIdx.x) {
	const unsigned int aux = idx & 31;

	if(aux >= 1) ptr[idx] = ptr[idx - 1] + ptr[idx];
	if(aux >= 2) ptr[idx] = ptr[idx - 2] + ptr[idx];
	if(aux >= 4) ptr[idx] = ptr[idx - 4] + ptr[idx];
	if(aux >= 8) ptr[idx] = ptr[idx - 8] + ptr[idx];
	if(aux >= 16) ptr[idx] = ptr[idx - 16] + ptr[idx];

	return ptr[idx];
}

__device__ int scan_block(int *ptr, const unsigned int idx = threadIdx.x) {
	const unsigned int aux = idx & 31;
	const unsigned int warp_id = idx >> 5;

	__shared__ int temp[32];

	int val = scan_warp(ptr, idx);

	__syncthreads();

	if(aux == 31) temp[warp_id] = ptr[idx];

	__syncthreads();

	if(warp_id == 0) scan_warp(temp, idx);

	__syncthreads();

	if(warp_id > 0) val = temp[warp_id - 1] + val;

	__syncthreads();

	ptr[idx] = val;

	__syncthreads();

	return val;
}

__global__ void scan_global(int *ptr) {
	const unsigned int idx = threadIdx.x;
	const unsigned int aux = idx & blockDim.x;
	const unsigned int bi = blockIdx.x;

	extern __shared__ int temp[];

	int val = scan_block(ptr, idx);

	__syncthreads();

	if(aux == blockDim.x) temp[bi] = ptr[idx];

	__syncthreads();

	if(bi == 0) scan_block(temp, idx);

	__syncthreads();

	if(bi > 0) val = temp[bi - 1] + val;

	__syncthreads();

	ptr[idx] = val;

	__syncthreads();

	return;
}

/**
 * Host function that prepares data array and passes it to the CUDA kernel.
 */
int main(void) {
	int *d = NULL;
	int i;
	unsigned int GRID_SIZE = (1 + VECTOR_SIZE) / WORK_SIZE;
	unsigned int idata[VECTOR_SIZE], odata[VECTOR_SIZE];

	for (i = 0; i < VECTOR_SIZE; i++)
		idata[i] = (unsigned int) i;

	CUDA_CHECK_RETURN(cudaMalloc((void**) &d, sizeof(int) * VECTOR_SIZE));
	CUDA_CHECK_RETURN(
			cudaMemcpy(d, idata, sizeof(int) * VECTOR_SIZE, cudaMemcpyHostToDevice));

	scan_global<<<GRID_SIZE, WORK_SIZE, WORK_SIZE * sizeof(int)>>>(d);

	CUDA_CHECK_RETURN(cudaDeviceSynchronize());	// Wait for the GPU launched work to complete
	CUDA_CHECK_RETURN(cudaGetLastError());
	CUDA_CHECK_RETURN(cudaMemcpy(odata, d, sizeof(int) * VECTOR_SIZE, cudaMemcpyDeviceToHost));

	unsigned int sum = idata[0];
	for (i = 0; i < VECTOR_SIZE - 1; i++) {
		if(odata[i] != sum) {
			printf("Erro !!!");
		}
		if((i + 1) < VECTOR_SIZE) {
			sum += idata[i+1];
		}
		printf("Input value: %u, device output: %u\n", idata[i], odata[i]);
	}

	if(odata[VECTOR_SIZE - 1] != sum) {
		printf("Erro !!!");
	}
	printf("Input value: %u, device output: %u\n", idata[i], odata[VECTOR_SIZE - 1]);

	CUDA_CHECK_RETURN(cudaFree((void*) d));
	CUDA_CHECK_RETURN(cudaDeviceReset());

	return 0;
}
