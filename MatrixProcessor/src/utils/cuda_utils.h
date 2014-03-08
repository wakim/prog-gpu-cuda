/*
 * cuda_utils.h
 *
 *  Created on: Jan 22, 2013
 *      Author: wakim
 */

#ifndef CUDA_UTILS_H_
#define CUDA_UTILS_H_

#include <math.h>
#include <stdio.h>
#include <cuda.h>
#include <cuda_runtime.h>
#include <stdlib.h>
#include <typeinfo>

#define CUDA_CHECK_RETURN(value) {								\
	cudaError_t _m_cudaStat = value;							\
	if (_m_cudaStat != cudaSuccess) {							\
		fprintf(stderr, "Error %s at line %d in file %s\n",		\
		cudaGetErrorString(_m_cudaStat), __LINE__, __FILE__);	\
		exit(1);												\
	}															\
}

namespace CudaUtils {
	inline unsigned int next_pow2(unsigned int x) {
		--x;
		x |= x >> 1;
		x |= x >> 2;
		x |= x >> 4;
		x |= x >> 8;
		x |= x >> 16;
		return ++x;
	}

	inline unsigned int best_sqrt(int x) {
		float f_x = static_cast<float>(x);

		f_x = sqrt(f_x);
		x = static_cast<int>(floor(f_x));

		return x;
	}

	inline void compute_num_threads_blocks(dim3& grid, dim3& block, int max_threads, int rows, int cols, bool square = false, bool check = true) {

		int sqrt_max_threads = best_sqrt(max_threads);

		if(! square) {
			block.y = sqrt_max_threads > rows ? rows : sqrt_max_threads;
			block.x = sqrt_max_threads > cols ? cols : sqrt_max_threads;
		} else {
			if(sqrt_max_threads > rows && sqrt_max_threads > cols) {
				block.x = block.y = (rows > cols ? cols : rows);
			} else {
				block.x = block.y = sqrt_max_threads;
			}
		}

		grid.x = static_cast<unsigned int>(cols / block.x);
		grid.y = static_cast<unsigned int>(rows / block.y);

		grid.x += (block.x % cols == 0 ? 0 : 1);
		grid.y += (block.y % rows == 0 ? 0 : 1);

		if(check) {
			cudaDeviceProp prop;
			int device;

			CUDA_CHECK_RETURN(cudaGetDevice(&device));
			CUDA_CHECK_RETURN(cudaGetDeviceProperties(&prop, device));

			if(block.x * block.y > static_cast<unsigned int>(prop.maxThreadsPerBlock)) {
				printf("rows, cols are too large, please choose a smaller's numbers (block) ! %u %u %u\n",
					block.x, block.y, prop.maxThreadsPerBlock
				);

				exit(EXIT_FAILURE);
			}

			if ((grid.x * grid.y) > static_cast<unsigned int>(prop.maxGridSize[0])) {
				printf("rows, cols are too large, please choose a smaller's numbers (grid) ! %u %u %u\n",
					grid.x, grid.y, prop.maxGridSize[0]
				);

				exit(EXIT_FAILURE);
			}
		}
	}

	inline cudaDeviceProp* get_cuda_device_properties() {
		cudaDeviceProp *prop = new cudaDeviceProp();
		int device;

		CUDA_CHECK_RETURN(cudaGetDevice(&device));
		CUDA_CHECK_RETURN(cudaGetDeviceProperties(prop, device));

		return prop;
	}

	template <typename T>
	T* generate_reverse_linear_matrix(unsigned int rows, unsigned int cols) {
		T* matrix = new T[rows * cols];
		int max = rows * cols + 1;

		for(unsigned int i = 0; i < rows; ++i) {
			for(unsigned int j = 0; j < cols; ++j) {
				matrix[i * cols + j] = static_cast<T>(max--);
			}
		}

		return matrix;
	}

	template <typename T>
	const char* get_format() {
		if(typeid(T) == typeid(int)) {
			return "%d ";
		} else if(typeid(T) == typeid(float)) {
			return "%1.2f ";
		} else if(typeid(T) == typeid(double)) {
			return "%1.2lf ";
		}
		return "";
	}

	template <typename T, bool line_number>
	void load_and_print(void* matrix_device, int rows, int cols, int start_row = 0, int start_col = 0) {
		int size = rows * cols;
		int size_bytes = size * sizeof(T);
		T* matrix_host = new T[size];
		const char* format = get_format<T>();

		if(line_number) {
			printf("format %s\n", format);
			printf("size_bytes %d\n", size_bytes);
		}

		CUDA_CHECK_RETURN(cudaMemcpy(matrix_host, matrix_device, size_bytes, cudaMemcpyDeviceToHost));

		for(int i = start_row; i < rows; ++i) {
			if(line_number) {
				printf("%d)", i);
			}
			for(int j = start_col; j < cols; ++j) {
				printf(format, matrix_host[i * cols + j]);
			}
			printf("\n");
		}

		delete matrix_host;
	}

	template <typename T, bool debug>
	void malloc_on_gpu(void** device_ptr, int rows, int cols) {
		size_t free, total;

		if(debug) {
			CUDA_CHECK_RETURN(cudaMemGetInfo(&free, &total));
			printf("Memory Info (Total: %u, Free: %u)\n", total, free);
		}

		CUDA_CHECK_RETURN(cudaMalloc(device_ptr, rows * cols * sizeof(T)));

		if(debug) {
			CUDA_CHECK_RETURN(cudaMemGetInfo(&free, &total));
			printf("Memory Info (Total: %u, Free: %u)\n", total, free);
		}
	}
}

#endif /* CUDA_UTILS_H_ */
