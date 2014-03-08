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
#include <string.h>

/**
 * This macro checks return value of the CUDA runtime call and exits
 * the application if the call failed.
 */
#define CUDA_CHECK_RETURN(value) {										\
	cudaError_t _m_cudaStat = value;									\
	if (_m_cudaStat != cudaSuccess) {									\
		fprintf(stderr, "Error %s at line %d in file %s\n",				\
				cudaGetErrorString(_m_cudaStat), __LINE__, __FILE__);	\
		exit(1);														\
	}																	\
}

float scan_seq(float *, int, int);
int calculate_grid_size(int, int);
float scan(float*, int, int, char*, int);
void fprint_mat(FILE *, float *, int);
float* init(int);

__global__ void scan_kernel(float *, int);
__global__ void scan_kernel_coalesc(float *, int);

int block_size;

int main(int argc, char **argv) {
	if(argc < 4) {
		printf("usage: %s <tamanho_vetor> <algoritmo> <tamanho_bloco> <debug opcional>\n\
algoritmo:\n\ts (Sequencial)\n\tc (Cuda nao coalescente)\n\tcc (Cuda coalescente)\n", argv[0]);
		exit(-1);
	}

	FILE *input = fopen(argv[1], "r");

	int debug = (argc > 4 ? strcmp("debug", argv[4]) == 0 : 0);
	int size = atoi(argv[1]);
	float *vector = init(size);
	float size_of = size * sizeof(float);
	float mega_byte = 1024 * 1024;

	block_size = atoi(argv[3]);

	printf("%f MBytes\n",  (size_of / mega_byte));

	if(strncmp(argv[2], "s", 1) == 0) {
		float sum = scan_seq(vector, size, debug);
		printf("Sum: %f\n", sum);
	} else {
		float sum = scan(vector, block_size, size, argv[2], debug);
		printf("Sum: %f\n", sum);
	}

	return 0;
}

int calculate_grid_size(int tile_size, int size) {
	int div = size / tile_size;
	int remainder = size - (tile_size * div);

	if(remainder > 0) {
		div++;
	}

	return div;
}

float scan(float *input, int tile_size, int size, char *algorithm, int debug) {
	int dim_grid = calculate_grid_size(tile_size, size);
	float *device_input;
	FILE *f = NULL;

	size_t size_bytes = size * sizeof(float);
	size_t block_size_bytes = tile_size * sizeof(float);

	CUDA_CHECK_RETURN(cudaMalloc((void **) &device_input, size_bytes));
	CUDA_CHECK_RETURN(cudaMemcpy(device_input, input, size_bytes, cudaMemcpyHostToDevice));

	if(strlen(algorithm) == 1 && strncmp(algorithm, "c", 1) == 0) {
		scan_kernel <<<dim_grid, tile_size>>> (device_input, size);
		if(debug) {
			f = fopen("saida_c.txt", "w");
		}
	} else {
		scan_kernel_coalesc <<<dim_grid, tile_size, block_size_bytes>>> (device_input, size);
		if(debug) {
			f = fopen("saida_cc.txt", "w");
		}
	}

	CUDA_CHECK_RETURN(cudaGetLastError());

	CUDA_CHECK_RETURN(cudaMemcpy(input, device_input, size_bytes, cudaMemcpyDeviceToHost));

	CUDA_CHECK_RETURN(cudaFree(device_input));

	// Percorro as bordas dos blocos para pegar o menor
	int index = 0;
	float sum = 0;
	float sum1 = 0.0, sum2 = 0.0;
	int half_dim_grid = dim_grid / 2;

	if(debug) {
		fprint_mat(f, input, size);
		fclose(f);
	}

	// Soma as bordas, soma a metade para evitar de perder precisao
	for(int i = 1; i < half_dim_grid; ++i) {
		index = (tile_size * i) - 1;
		sum1 += input[index];
	}

	for(int i = half_dim_grid; i < dim_grid; ++i) {
		index = (tile_size * i) - 1;
		sum2 += input[index];
	}

	sum = sum1;

	if((size) != index) {
		sum += input[size - 1];
	}

	sum += sum2;

	return sum;
}

float scan_seq(float *input, int size, int debug) {
	float found = 0;

	for(int i = 0; i < size; ++i) {
		found += input[i];
	}

	if(debug) {
		FILE *f = fopen("saida_s.txt", "w");
		fprint_mat(f, input, size);
		fclose(f);
	}

	return found;
}

void fprint_mat(FILE *f, float *v, int n) {
	for(int i = 0; i < n-1; i++) {
		fprintf(f, "%f ", v[i]);
	}

	fprintf(f, "%f", v[n-1]);
}

float* init(int n) {
	float *v = (float*) malloc(sizeof(float) * n);

	for(int i = 0; i < n; ++i) {
		v[i] = (float) i;
	}

	return v;
}

////////////////////////////////////////////////////////////////////////////////

/***
 * Esse Scan é feito apenas no interior do bloco, logo quem chamou ele precisa verificar
 * os limites dos blocos para pegar o menor valor
 */
__global__
void scan_kernel(float *input, int size) {
	int local_block_dim = blockDim.x;
	int bi = local_block_dim * blockIdx.x;
	int ti = bi + threadIdx.x;
	int ti_bi = ti - bi; // ti - bi evita que a thread saia do limite do bloco.
	int local_size = size;
	float aux = 0;
	int offset = 1;

	// Algoritmo do Scan em cima das posições e threads relativas ao bloco
	for(offset = 1; offset < local_block_dim; offset *= 2) {

		if(ti_bi >= offset && ti < local_size) {
			aux = input[ti - offset];
		}

		__syncthreads();

		if(ti_bi >= offset && ti < local_size) {
			input[ti] = aux + input[ti];
		}

		__syncthreads();
	}
}

__global__
void scan_kernel_coalesc(float *input, int size) {
	int local_block_dim = blockDim.x;
	int thread_id = threadIdx.x;
	int bi = local_block_dim * blockIdx.x;
	int ti = bi + threadIdx.x;
	int local_size = size;
	float aux = 0;
	int offset = 1;

	extern __shared__ float local[];

	// Carrega o valor relativo a thread para a memória local.
	if(ti < local_size) {
		local[thread_id] = input[ti];
	}

	__syncthreads();

	// Aplica o Scan em cima da memória local
	for(offset = 1; offset < local_block_dim; offset *= 2) {

		if(thread_id >= offset && thread_id < local_block_dim) {
			aux = local[thread_id - offset];
		}

		__syncthreads();

		if(thread_id >= offset && thread_id < local_block_dim) {
			local[thread_id] = aux + local[thread_id];
		}

		__syncthreads();
	}

	// Volta com o valor local na memória global
	input[ti] = local[thread_id];
}
