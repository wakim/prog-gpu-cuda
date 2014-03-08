/**
 * Copyright 1993-2012 NVIDIA Corporation.  All rights reserved.
 *
 * Please refer to the NVIDIA end user license agreement (EULA) associated
 * with this source code for terms and conditions that govern your use of
 * this software. Any use, reproduction, disclosure, or distribution of
 * this software and related documentation outside the terms of the EULA
 * is strictly prohibited.
 */

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <ctime>

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

void alloc_on_device(float *, float*, void **, void **, int);
void free_on_device(void *, void*);
void copy_from_device(void *, float*, int);
void fprint_mat(FILE *, float *, int);
void a_x_mais_y_host(int, float *, float*, int);
float* init(int);

__global__ void a_x_mais_y_device(int, float* , float*, int);
__global__ void a_x_mais_y_device_coalesce(int, float*, float*, int);

const int SEQUENTIAL = 1;
const int CUDA = 2;
const int CUDA_COALESCE = 4;

/**
 * Host function that prepares data array and passes it to the CUDA kernel.
 */
int main(int argc, char ** argv) {

	if(argc < 4) {
		printf("Uso: %s <algoritmo> <tamanho_vetor> <tamanho_bloco> <a opcional> <debug opcional>\n\
algoritmo:\n\ts (Sequencial)\n\tc (Cuda nao coalescente)\n\tcc (Cuda coalescente)\n", argv[0]);
		return -1;
	}

	const char * mode = (argc > 1 ? argv[1] : "");
	const int vector_size = (argc > 2 ? atoi(argv[2]) : 0);
	const int block_size = (argc > 3 ? atoi(argv[3]) : 0);
	const int debug = argc > 4 ? strcmp(argv[4], "debug") == 0 : 0;

	srand(time(NULL));

	int state = -1;
	float *x = init(vector_size);
	float *y = init(vector_size);
	float *x_device, *y_device;
	int n_blocks = (vector_size + (block_size - 1)) / block_size;
	int shared_memory = block_size * 2 * sizeof(float);
	float a = 0.0f;

	FILE *f_a;
	FILE *f_x;
	FILE *f_y;
	FILE *f_axy;

	if(argc > 4) {
		a = atof(argv[4]);
	} else {
		a = (float) (rand() % vector_size);
	}

	if(strncmp(mode, "s", 1) == 0) {
		state = SEQUENTIAL;
		if(debug) {
			f_a = fopen("y_s.txt", "w");
			f_x = fopen("x_s.txt", "w");
			f_y = fopen("y_s.txt", "w");
			f_axy = fopen("axy_s.txt", "w");
		}
	} else if(strlen(mode) == 1 && strncmp(mode, "c", 1) == 0) {
		state = CUDA;
		if(debug) {
			f_a = fopen("y_c.txt", "w");
			f_x = fopen("x_c.txt", "w");
			f_y = fopen("y_c.txt", "w");
			f_axy = fopen("axy_c.txt", "w");
		}
	} else if(strncmp(mode, "cc", 2) == 0) {
		state = CUDA_COALESCE;
		if(debug) {
			f_a = fopen("y_c.txt", "w");
			f_x = fopen("x_cc.txt", "w");
			f_y = fopen("y_cc.txt", "w");
			f_axy = fopen("axy_cc.txt", "w");
		}
	}

	if(debug) {
		fprintf(f_a, "%f", a);
		fprint_mat(f_x, x, vector_size);
		fprint_mat(f_y, y, vector_size);
	}

	if(state == SEQUENTIAL) {
		a_x_mais_y_host(a, x, y, vector_size);
	} else {
		alloc_on_device(x, y, (void**)&x_device, (void**) &y_device, vector_size);

		if(state == CUDA) {
			a_x_mais_y_device<<<n_blocks, block_size>>>(a, x_device, y_device, vector_size);
		} else if(state == CUDA_COALESCE) {
			a_x_mais_y_device_coalesce<<<n_blocks, block_size, shared_memory>>>(a, x_device, y_device, vector_size);
		}

		copy_from_device(y_device, y, vector_size);
	}

	if(debug) {
		fprint_mat(f_axy, y, vector_size);
		fclose(f_x);
		fclose(f_y);
		fclose(f_axy);
		fclose(f_a);
	}

	free(x);
	free(y);

	return 0;
}

void fprint_mat(FILE *f, float *v, int n) {
	for(int i = 0; i < n-1; i++) {
		fprintf(f, "%f ", v[i]);
	}

	fprintf(f, "%f", v[n-1]);
}

void alloc_on_device(float *x, float *y, void **x_ptr, void **y_ptr, int n) {
	size_t size = sizeof(float) * n;
	CUDA_CHECK_RETURN(cudaMalloc(x_ptr, size));
	CUDA_CHECK_RETURN(cudaMalloc(y_ptr, size));
	CUDA_CHECK_RETURN(cudaMemcpy(*x_ptr, x, size, cudaMemcpyHostToDevice));
	CUDA_CHECK_RETURN(cudaMemcpy(*y_ptr, y, size, cudaMemcpyHostToDevice));
}

void copy_from_device(void *v_ptr, float *v, int n) {
	cudaMemcpy(v, v_ptr, sizeof(float) * n, cudaMemcpyDeviceToHost);
}

void free_on_device(void *x_ptr, void *y_ptr) {
	cudaFree(x_ptr);
	cudaFree(y_ptr);
}

void a_x_mais_y_host(int a, float *x, float* y, int n) {
	for(int i = 0; i < n; ++i) {
		y[i] = (a * x[i]) + y[i];
	}
}

float* init(int n) {
	float *v = (float*) malloc(sizeof(float) * n);

	for(int i = 0; i < n; ++i) {
		v[i] = (float) i;
	}

	return v;
}

////////////////////////////////////////////////////////////////////////////////

__global__ void a_x_mais_y_device(int a, float* x, float* y, int n) {
	int i = blockDim.x * blockIdx.x + threadIdx.x;

	if(i < n) {
		y[i] = a * x[i] + y[i];
	}
}

__global__ void a_x_mais_y_device_coalesce(int a, float* x, float* y, int n) {
	int i = blockDim.x * blockIdx.x + threadIdx.x;
	int ti = threadIdx.x;

	extern __shared__ float sharedX[];
	float *sharedY = &sharedX[0] + blockDim.x;

	if(i < n) {
		sharedX[ti] = x[i];
		sharedY[ti] = y[i];

		y[i] = a * sharedX[ti] + sharedY[ti];
	}
}
