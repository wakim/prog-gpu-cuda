/*
 * kernels.cu.h
 *
 *  Created on: Jan 21, 2013
 *      Author: wakim
 */

#ifndef KERNELS_CU_H_
#define KERNELS_CU_H_

#include "../utils/cuda_utils.h"

/**
 * Faz a normalização da matriz baseado
 * @matrix_block, @matrix_grid, @rows e @cols estão relacionados com @input_matrix
 * @max_block e @max_grid são dados de @max_matrix
 */
template <typename T, typename N, int max_threads, bool specialized>
N* normalize_matrix_kernel_wrapper(dim3 matrix_block, dim3 matrix_grid, T* matrix_device, int rows, int cols);

/**
 * Vai fazer a transformação da matriz TxD para aplicar as métricas de tf-idf em cada elemento
 * da matriz.
 * Retorna uma matriz do tipo N (float ou double)
 */
template <typename T, typename N, int max_threads, bool specialized>
N* apply_tf_idf_metrics(dim3 matrix_block, dim3 matrix_grid, T* matrix_device, int rows, int cols);

template <typename T>
class MaxReduceOperation {
	public:
		inline __device__ void operator() (T local_aux, T* array, unsigned int pos) {
			if(local_aux > array[pos]) {
				array[pos] = local_aux;
			}
		}
};

template <typename T>
class SumReduceOperation {
public:
	inline __device__ void operator() (T local_aux, T* array, unsigned int pos) {
		array[pos] += local_aux;
	}
};

// Esse cara transformar qualquer número maior que 0 em 1
template <typename T>
class DFISharedPositionSetter {
public:
	inline __device__ void operator() (T* shared_matrix, unsigned int shared_pos,
		T* global_matrix, unsigned int matrix_pos) {

		shared_matrix[shared_pos] = !! (global_matrix[matrix_pos]);
	}
};

template <typename T>
class DefaultSharedPositionSetter {
public:
	inline __device__ void operator() (T* shared_matrix, unsigned int shared_pos,
		T* global_matrix, unsigned int matrix_pos) {

		shared_matrix[shared_pos] = global_matrix[matrix_pos];
	}
};

template <typename T, typename N>
class NonCastNormalizeMatrixOperation {
public:
	inline __device__ void operator() (N* dest, T* src, T value, int pos) {
		if(value != static_cast<T>(0)) {
			dest[pos] = (src[pos] / value);
		} else {
			dest[pos] = static_cast<N>(0);
		}
	}
};

template <typename T, typename N>
class CastNormalizeMatrixOperation {
public:
	inline __device__ void operator() (N* dest, T* src, T value, int pos) {
		if(value != static_cast<T>(0)) {
			dest[pos] = (static_cast<N>(src[pos]) / static_cast<N>(value));
		} else {
			dest[pos] = static_cast<N>(0);
		}
	}
};

template <typename T, typename N>
class NonCastTFIDFOperation {
public:
	inline __device__ void operator() (N* dest, T* src, T max_fj, T dfi, int pos, int _N) {
		N tf_ij = max_fj == 0 ? 0 : src[pos] / max_fj;
		N idf_i = dfi == 0 ? 0 : log10(static_cast<N>(_N) / dfi);

		dest[pos] = tf_ij * idf_i;
	}
};

template <typename T, typename N>
class CastTFIDFOperation {
public:
	inline __device__ void operator() (N* dest, T* src, T max_fj, T dfi, int pos, int _N) {
		N tf_ij = max_fj == 0 ? 0 : static_cast<N>(src[pos]) / static_cast<N>(max_fj);
		N idf_i = dfi == 0 ? 0 : log10(static_cast<N>(_N) / static_cast<N>(dfi));

		dest[pos] = tf_ij * idf_i;
	}
};

template
float* apply_tf_idf_metrics<int, float, 912, true>
	(dim3 matrix_block, dim3 matrix_grid, int* matrix_device, int rows, int cols);

template
float* apply_tf_idf_metrics<int, float, 912, false>
	(dim3 matrix_block, dim3 matrix_grid, int* matrix_device, int rows, int cols);

template
float* apply_tf_idf_metrics<int, float, 896, true>
	(dim3 matrix_block, dim3 matrix_grid, int* matrix_device, int rows, int cols);

template
float* apply_tf_idf_metrics<int, float, 896, false>
	(dim3 matrix_block, dim3 matrix_grid, int* matrix_device, int rows, int cols);

template
float* apply_tf_idf_metrics<int, float, 768, true>
	(dim3 matrix_block, dim3 matrix_grid, int* matrix_device, int rows, int cols);

template
float* apply_tf_idf_metrics<int, float, 768, false>
	(dim3 matrix_block, dim3 matrix_grid, int* matrix_device, int rows, int cols);

template
float* apply_tf_idf_metrics<int, float, 512, true>
	(dim3 matrix_block, dim3 matrix_grid, int* matrix_device, int rows, int cols);

template
float* apply_tf_idf_metrics<int, float, 512, false>
	(dim3 matrix_block, dim3 matrix_grid, int* matrix_device, int rows, int cols);

template
float* apply_tf_idf_metrics<int, float, 256, true>
	(dim3 matrix_block, dim3 matrix_grid, int* matrix_device, int rows, int cols);

template
float* apply_tf_idf_metrics<int, float, 256, false>
	(dim3 matrix_block, dim3 matrix_grid, int* matrix_device, int rows, int cols);

template
float* normalize_matrix_kernel_wrapper<int, float, 912, true>
	(dim3 matrix_block, dim3 matrix_grid, int* matrix_device, int rows, int cols);

template
float* normalize_matrix_kernel_wrapper<float, float, 912, true>
	(dim3 matrix_block, dim3 matrix_grid, float* matrix_device, int rows, int cols);

template
float* normalize_matrix_kernel_wrapper<int, float, 896, true>
	(dim3 matrix_block, dim3 matrix_grid, int* matrix_device, int rows, int cols);

template
float* normalize_matrix_kernel_wrapper<float, float, 896, true>
	(dim3 matrix_block, dim3 matrix_grid, float* matrix_device, int rows, int cols);

template
float* normalize_matrix_kernel_wrapper<int, float, 768, true>
	(dim3 matrix_block, dim3 matrix_grid, int* matrix_device, int rows, int cols);

template
float* normalize_matrix_kernel_wrapper<float, float, 768, true>
	(dim3 matrix_block, dim3 matrix_grid, float* matrix_device, int rows, int cols);

template
float* normalize_matrix_kernel_wrapper<int, float, 512, true>
	(dim3 matrix_block, dim3 matrix_grid, int* matrix_device, int rows, int cols);

template
float* normalize_matrix_kernel_wrapper<float, float, 512, true>
	(dim3 matrix_block, dim3 matrix_grid, float* matrix_device, int rows, int cols);

template
float* normalize_matrix_kernel_wrapper<int, float, 256, true>
	(dim3 matrix_block, dim3 matrix_grid, int* matrix_device, int rows, int cols);

template
float* normalize_matrix_kernel_wrapper<float, float, 256, true>
	(dim3 matrix_block, dim3 matrix_grid, float* matrix_device, int rows, int cols);

template
float* normalize_matrix_kernel_wrapper<int, float, 768, false>
	(dim3 matrix_block, dim3 matrix_grid, int* matrix_device, int rows, int cols);

template
float* normalize_matrix_kernel_wrapper<float, float, 768, false>
	(dim3 matrix_block, dim3 matrix_grid, float* matrix_device, int rows, int cols);

template
float* normalize_matrix_kernel_wrapper<int, float, 512, false>
	(dim3 matrix_block, dim3 matrix_grid, int* matrix_device, int rows, int cols);

template
float* normalize_matrix_kernel_wrapper<float, float, 512, false>
	(dim3 matrix_block, dim3 matrix_grid, float* matrix_device, int rows, int cols);

template
float* normalize_matrix_kernel_wrapper<int, float, 256, false>
	(dim3 matrix_block, dim3 matrix_grid, int* matrix_device, int rows, int cols);

template
float* normalize_matrix_kernel_wrapper<float, float, 256, false>
	(dim3 matrix_block, dim3 matrix_grid, float* matrix_device, int rows, int cols);

#endif /* KERNELS_CU_H_ */
