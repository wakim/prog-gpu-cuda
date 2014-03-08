
#include "shared_memory.cu.h"

template <typename T, typename N>
__global__ void multiple_normalize_cast(N* output_matrix, T* input_matrix, T* max_block_matrix, int rows, int cols,
	int block_matrix_cols) {

	unsigned int tx = threadIdx.x, ty = threadIdx.y;
	unsigned int bx = blockIdx.x, by = blockIdx.y;
	unsigned int bdx = blockDim.x, bdy = blockDim.y;
	unsigned int col = (bx * bdx) + tx;
	unsigned int row = (by * bdy) + ty;
	unsigned int matrix_pos = row * cols + col;
	bool in_bounds = row < rows && col < cols;
	
	if(in_bounds) {
		unsigned int block_matrix_pos = block_matrix_cols - 1; // Pega o último elemento
		
		T value = max_block_matrix[block_matrix_pos];

		if(value != static_cast<T>(0)) {
			output_matrix[matrix_pos] = (static_cast<N>(input_matrix[matrix_pos]) / static_cast<N>(max_block_matrix[block_matrix_pos]));
		} else {
			output_matrix[matrix_pos] = static_cast<N>(0);
		}
	}
}

template <typename T, typename N>
__global__ void multiple_normalize_non_cast(N* output_matrix, T* input_matrix, T* max_block_matrix, int rows, int cols,
	int block_matrix_cols) {

	unsigned int tx = threadIdx.x, ty = threadIdx.y;
	unsigned int bx = blockIdx.x, by = blockIdx.y;
	unsigned int bdx = blockDim.x, bdy = blockDim.y;
	unsigned int col = (bx * bdx) + tx;
	unsigned int row = (by * bdy) + ty;
	unsigned int matrix_pos = row * cols + col;
	bool in_bounds = row < rows && col < cols;
	
	if(in_bounds) {
		unsigned int block_matrix_pos = block_matrix_cols - 1; // Pega o último elemento
		
		T value = max_block_matrix[block_matrix_pos];

		if(value != static_cast<T>(0)) {
			output_matrix[matrix_pos] = (input_matrix[matrix_pos] / max_block_matrix[block_matrix_pos]);
		} else {
			output_matrix[matrix_pos] = static_cast<N>(0);
		}
	}
}

template <typename T, typename N>
__global__ void transform_tf_idf_cast(N* output_matrix, T* input_matrix, int rows, int cols,
	T* dfi_matrix, T* max_fj_matrix, int dfi_matrix_cols, int max_fj_matrix_cols) {

	unsigned int tx = threadIdx.x, ty = threadIdx.y;
	unsigned int bx = blockIdx.x, by = blockIdx.y;
	unsigned int bdx = blockDim.x, bdy = blockDim.y;
	unsigned int col = (bx * bdx) + tx;
	unsigned int row = (by * bdy) + ty;
	unsigned int matrix_pos = row * cols + col;
	bool in_bounds = row < rows && col < cols;

	if(in_bounds) {
		unsigned int dfi_matrix_pos = (row * dfi_matrix_cols) + (dfi_matrix_cols - 1);
		unsigned int max_fj_matrix_pos = (col * max_fj_matrix_cols) + (max_fj_matrix_cols - 1);
		
		T max_fj = max_fj_matrix[max_fj_matrix_pos];
		T dfi = dfi_matrix[dfi_matrix_pos];
		
		N tf_ij = max_fj == 0 ? 0 : static_cast<N>(input_matrix[matrix_pos]) / static_cast<N>(max_fj);
		N idf_i = dfi == 0 ? 0 : log10(static_cast<N>(cols) / static_cast<N>(dfi));

		output_matrix[matrix_pos] = tf_ij * idf_i;
	}
}

template <typename T, typename N>
__global__ void transform_tf_idf_non_cast(N* output_matrix, T* input_matrix, int rows, int cols,
	T* dfi_matrix, T* max_fj_matrix, int dfi_matrix_cols, int max_fj_matrix_cols) {

	unsigned int tx = threadIdx.x, ty = threadIdx.y;
	unsigned int bx = blockIdx.x, by = blockIdx.y;
	unsigned int bdx = blockDim.x, bdy = blockDim.y;
	unsigned int col = (bx * bdx) + tx;
	unsigned int row = (by * bdy) + ty;
	unsigned int matrix_pos = row * cols + col;
	bool in_bounds = row < rows && col < cols;

	if(in_bounds) {
		unsigned int dfi_matrix_pos = (row * dfi_matrix_cols) + (dfi_matrix_cols - 1);
		unsigned int max_fj_matrix_pos = (col * max_fj_matrix_cols) + (max_fj_matrix_cols - 1);
		
		T max_fj = max_fj_matrix[max_fj_matrix_pos];
		T dfi = dfi_matrix[dfi_matrix_pos];
		
		N tf_ij = max_fj == 0 ? 0 : input_matrix[matrix_pos] / max_fj;
		N idf_i = dfi == 0 ? 0 : log10(static_cast<N>(cols) / dfi);

		output_matrix[matrix_pos] = tf_ij * idf_i;
	}
}