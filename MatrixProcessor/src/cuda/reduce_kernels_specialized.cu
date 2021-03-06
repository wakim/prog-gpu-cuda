
#include "shared_memory.cu.h"

/**
 * Aplica o algoritmo redu��o no vetor dado.
**/
template <typename T>
__device__ void reduce_max(T* shared_array, int array_limit,
	int ti, int shared_pos, bool in_bounds) {
	int offset = 1;
	T local_aux = static_cast<T>(-1);

	for(offset = 1; offset < array_limit; offset <<= 1) {

		if(in_bounds && ti >= offset) {
			local_aux = shared_array[shared_pos - offset];
		}

		__syncthreads();

		if(in_bounds && ti >= offset) {
			if(local_aux > shared_array[shared_pos]) {
				shared_array[shared_pos] = local_aux;
			}
		}

		__syncthreads();
	}
}

template <typename T>
__device__ void reduce_sum(T* shared_array, int array_limit,
	int ti, int shared_pos, bool in_bounds) {
	int offset = 1;
	T local_aux = static_cast<T>(-1);

	for(offset = 1; offset < array_limit; offset <<= 1) {

		if(in_bounds && ti >= offset) {
			local_aux = shared_array[shared_pos - offset];
		}

		__syncthreads();

		if(in_bounds && ti >= offset) {
			shared_array[shared_pos] += local_aux;
		}

		__syncthreads();
	}
}

/**
 * Nesse kernel, cada grid � uma linha da matrix dos resultados parciais do kernel anterior
 * E s� � lan�ado um bloco por linha
 */
template <typename T>
__global__ void multiple_reduce_2_max_default_setter(T* block_matrix, int rows, int cols) {

	unsigned int ti = threadIdx.x, bx = blockIdx.x;
	unsigned int matrix_pos = bx * cols + ti;
	bool in_bounds = bx < rows && ti < cols;

	SharedMemory<T> shared_memory;
	T* shared_array = shared_memory.getPointer();

	if(in_bounds) {
		shared_array[ti] = block_matrix[matrix_pos];
	}

	__syncthreads();

	reduce_max(shared_array, cols, ti, ti, in_bounds);

	if(in_bounds) {
		block_matrix[matrix_pos] = shared_array[ti];
	}
}

template <typename T>
__global__ void multiple_reduce_2_sum_default_setter(T* block_matrix, int rows, int cols) {

	unsigned int ti = threadIdx.x, bx = blockIdx.x;
	unsigned int matrix_pos = bx * cols + ti;
	bool in_bounds = bx < rows && ti < cols;

	SharedMemory<T> shared_memory;
	T* shared_array = shared_memory.getPointer();

	if(in_bounds) {
		shared_array[ti] = block_matrix[matrix_pos];
	}

	__syncthreads();

	reduce_sum(shared_array, cols, ti, ti, in_bounds);

	if(in_bounds) {
		block_matrix[matrix_pos] = shared_array[ti];
	}
}

/*
 * Esse kernel far� a redu��o modificada em cada linha da matriz, para obter o maior valor dela.
 * Esse kernel s� faz a redu��o intra bloco, um segundo kernel precisa ser chamado para finalizar
 * o calculo.
 * @matrix � a matriz inteira
 * @block_matrix � uma matriz temporaria para o resultado da redu��o de cada bloco
 * block_matrix ser� usada depois no multiple_max2.
 */
template <typename T>
__global__ void multiple_reduce_max_default_setter(T* matrix, T* block_matrix, int rows, int cols) {

	unsigned int tx = threadIdx.x, ty = threadIdx.y;
	unsigned int bx = blockIdx.x, by = blockIdx.y;
	unsigned int bdx = blockDim.x, bdy = blockDim.y;
	unsigned int col = (bx * bdx) + tx;
	unsigned int row = (by * bdy) + ty;
	unsigned int matrix_pos = row * cols + col, shared_pos = (ty * bdx + tx);
	bool in_bounds = row < rows && col < cols;

	// � do tamanho do bloco
	SharedMemory<T> shared_memory;
	T* shared_array = shared_memory.getPointer();

	if(in_bounds) {
		shared_array[shared_pos] = matrix[matrix_pos];
	}

	__syncthreads();

	reduce_max(shared_array, bdx, tx, shared_pos, in_bounds);

	if(in_bounds && (tx == (bdx - 1) || col == (cols - 1))) {
		unsigned int v = row * gridDim.x + bx;

		block_matrix[v] = shared_array[shared_pos];
	}
}

template <typename T>
__global__ void multiple_reduce_sum_dfi_setter(T* matrix, T* block_matrix, int rows, int cols) {

	unsigned int tx = threadIdx.x, ty = threadIdx.y;
	unsigned int bx = blockIdx.x, by = blockIdx.y;
	unsigned int bdx = blockDim.x, bdy = blockDim.y;
	unsigned int col = (bx * bdx) + tx;
	unsigned int row = (by * bdy) + ty;
	unsigned int matrix_pos = row * cols + col, shared_pos = (ty * bdx + tx);
	bool in_bounds = row < rows && col < cols;

	// � do tamanho do bloco
	SharedMemory<T> shared_memory;
	T* shared_array = shared_memory.getPointer();

	if(in_bounds) {
		shared_array[shared_pos] = !! matrix[matrix_pos];
	}

	__syncthreads();

	reduce_sum(shared_array, bdx, tx, shared_pos, in_bounds);

	if(in_bounds && (tx == (bdx - 1) || col == (cols - 1))) {
		unsigned int v = row * gridDim.x + bx;

		block_matrix[v] = shared_array[shared_pos];
	}
}