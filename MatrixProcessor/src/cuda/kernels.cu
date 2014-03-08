/* *
 * Copyright 1993-2012 NVIDIA Corporation.  All rights reserved.
 *
 * Please refer to the NVIDIA end user license agreement (EULA) associated
 * with this source code for terms and conditions that govern your use of
 * this software. Any use, reproduction, disclosure, or distribution of
 * this software and related documentation outside the terms of the EULA
 * is strictly prohibited.
 */

#include <stdio.h>
#include <typeinfo>

#include "kernels.cu.h"
#include "reduce_kernels.cu"
#include "reduce_kernels_specialized.cu"
#include "general_kernels.cu"
#include "general_kernels_specialized.cu"

template <typename T, int max_threads>
T* transpose_matrix(T* matrix_device, dim3 block, dim3 grid, int rows, int cols) {
	T* t_matrix_device = NULL;
	int shared_array_size_bytes = block.x * (block.y + 1) * sizeof(T);

	CudaUtils::malloc_on_gpu<T, false>((void**) &t_matrix_device, cols, rows);

	transpose<T> <<<grid, block, shared_array_size_bytes>>>(t_matrix_device, matrix_device, cols, rows);
	CUDA_CHECK_RETURN(cudaDeviceSynchronize());

	return t_matrix_device;
}

template <typename T, typename Operation, typename SharedMatrixSetter, bool specialized>
T* apply_reduce_operation_line(dim3& block, dim3& grid, T* matrix_device,
	int rows, int cols, Operation op, SharedMatrixSetter setter) {

	return apply_reduce_operation_line<T, Operation, SharedMatrixSetter, SharedMatrixSetter, specialized>
	(
		block, grid, matrix_device, rows, cols, op, setter, setter
	);
}

/**
 * Aplica uma determinada operação em cada linha da matriz em paralelo
 */
template <typename T, typename Operation, typename SharedMatrixSetter1, typename SharedMatrixSetter2, bool specialized>
T* apply_reduce_operation_line(dim3& block, dim3& grid, T* matrix_device,
	int rows, int cols, Operation op, SharedMatrixSetter1 setter1, SharedMatrixSetter2 setter2) {
	T* block_matrix_device = NULL;
	int shared_matrix_size = block.x * block.y;
	int shared_matrix_size_bytes = shared_matrix_size * sizeof(T);

	int block_matrix_cols = grid.x;

	CudaUtils::malloc_on_gpu<T, false>((void**) &block_matrix_device, rows, block_matrix_cols);

	//printf("\n\n\nmatrix_device on reduce %s %s %s %s\n\n\n", typeid(T).name(),
	//	typeid(Operation).name(), typeid(SharedMatrixSetter1).name(), typeid(SharedMatrixSetter2).name()
	//);

	//CudaUtils::load_and_print<T, true>(matrix_device, rows, cols);

	if(specialized) {
		if(typeid(Operation) == typeid(MaxReduceOperation<T>) && typeid(SharedMatrixSetter1) == typeid(DefaultSharedPositionSetter<T>)) {
			multiple_reduce_max_default_setter<T> <<<grid, block, shared_matrix_size_bytes>>>
				(matrix_device, block_matrix_device, rows, cols);
		} else if(typeid(Operation) == typeid(SumReduceOperation<T>)) {
			multiple_reduce_sum_dfi_setter<T> <<<grid, block, shared_matrix_size_bytes>>>
				(matrix_device, block_matrix_device, rows, cols);
		}
	} else {
		multiple_reduce<T> <<<grid, block, shared_matrix_size_bytes>>>
			(matrix_device, block_matrix_device, rows, cols, op, setter1);
	}

	CUDA_CHECK_RETURN(cudaDeviceSynchronize());

	//printf("\n\n\nblock_matrix_device on reduce %s %d %d %d %d\n\n\n", typeid(T).name(), rows,
	//	block_matrix_cols, grid.x, grid.y
	//);

	//CudaUtils::load_and_print<T, true>(block_matrix_device, rows, block_matrix_cols);

	block.y = 1;
	block.x = block_matrix_cols;
	grid.y = 1;
	grid.x = rows;

	shared_matrix_size = block.x;
	shared_matrix_size_bytes = block.x * sizeof(T);

	if(specialized) {
		if(typeid(Operation) == typeid(MaxReduceOperation<T>) && typeid(SharedMatrixSetter2) == typeid(DefaultSharedPositionSetter<T>)) {
			multiple_reduce_2_max_default_setter<T> <<<grid, block, shared_matrix_size_bytes>>>
			(
				block_matrix_device, rows, block_matrix_cols
			);
		} else if(typeid(Operation) == typeid(SumReduceOperation<T>)) {
			multiple_reduce_2_sum_default_setter<T> <<<grid, block, shared_matrix_size_bytes>>>
			(
				block_matrix_device, rows, block_matrix_cols
			);
		}
	} else {
		multiple_reduce_2<T> <<<grid, block, shared_matrix_size_bytes>>>
		(
			block_matrix_device, rows, block_matrix_cols, op, setter2
		);
	}

	CUDA_CHECK_RETURN(cudaDeviceSynchronize());

	//printf("\n\n\nblock_matrix_device on reduce2 %s %d %d\n\n\n", typeid(T).name(), rows, block_matrix_cols);
	//CudaUtils::load_and_print<T, true>(block_matrix_device, rows, block_matrix_cols);

	return block_matrix_device;
}

/**
 * Normaliza a matriz linha a linha
 */
template <typename T, typename N, int max_threads, bool specialized>
N* normalize_matrix_kernel_wrapper(dim3 matrix_block, dim3 matrix_grid,
	T* matrix_device, int rows, int cols) {

	dim3 max_matrix_block(matrix_block), max_matrix_grid(matrix_grid);

	//printf("\n\nmatrix_device\n\n");
	//CudaUtils::load_and_print<T, false>(matrix_device, rows, cols, rows - 10, cols - 10);

	T* max_matrix_device = apply_reduce_operation_line<T, MaxReduceOperation<T>, DefaultSharedPositionSetter<T>, specialized>
	(
		max_matrix_block, max_matrix_grid, matrix_device, rows, cols,
		MaxReduceOperation<T>(), DefaultSharedPositionSetter<T>()
	);

	//printf("\nNORMALIZE %d %d %s\n", rows, cols, typeid(T).name());
	//printf("\n\nmax_matrix_device\n\n");
	//CudaUtils::load_and_print<T, false>(max_matrix_device, rows, max_matrix_block.x);

	dim3 t_max_matrix_block, t_max_matrix_grid;
	CudaUtils::compute_num_threads_blocks(t_max_matrix_grid, t_max_matrix_block, max_threads, rows, max_matrix_block.x, true, true);
	T* t_max_matrix_device = transpose_matrix<T, max_threads>(max_matrix_device, t_max_matrix_block, t_max_matrix_grid, rows, max_matrix_block.x);
	
	T* t_max_matrix_device_last_line = & t_max_matrix_device[(max_matrix_block.x - 1) * (rows)];

	//printf("\n\nt_max_matrix_device\n\n");
	//CudaUtils::load_and_print<T, true>(t_max_matrix_device, max_matrix_block.x, rows);
	//printf("\n\n_t_max_matrix_device_last_line\n\n");
	//CudaUtils::load_and_print<T, true>(t_max_matrix_device_last_line, 1, rows);

	CudaUtils::compute_num_threads_blocks(t_max_matrix_grid, t_max_matrix_block, max_threads, 1, rows, false, true);

	T* t_max_matrix_reduced = apply_reduce_operation_line<T, MaxReduceOperation<T>, DefaultSharedPositionSetter<T>, specialized>
	(
		t_max_matrix_block, t_max_matrix_grid, t_max_matrix_device_last_line, 1, rows,
		MaxReduceOperation<T>(), DefaultSharedPositionSetter<T>()
	);

	//printf("\n\n_t_max_matrix_device_last_line_reduced\n\n");
	//CudaUtils::load_and_print<T, true>(t_max_matrix_reduced, 1, t_max_matrix_block.x, 0, 0);

	N* matrix_result_device = NULL;
	CudaUtils::malloc_on_gpu<T, false>((void**) &matrix_result_device, rows, cols);

	//printf("t_m_m_b.x %d rows %d cols %d\n", t_max_matrix_block.x, rows, cols);
	//printf("b_x %d b_y %d g_x %d g_y %d\n", matrix_block.x, matrix_block.y, matrix_grid.x, matrix_grid.y);
	//printf("VAI CHAMAR O NORMALIZE\n");

	if(typeid(T) == typeid(N)) {
		if(specialized) {
			multiple_normalize_non_cast<T, N> <<<matrix_grid, matrix_block>>>
			(
				matrix_result_device, matrix_device, t_max_matrix_reduced,
				rows, cols, t_max_matrix_block.x
			);
		} else {
			multiple_normalize<T, N> <<<matrix_grid, matrix_block>>>
			(
				matrix_result_device, matrix_device, t_max_matrix_reduced,
				rows, cols, t_max_matrix_block.x, NonCastNormalizeMatrixOperation<T, N>()
			);
		}
	} else {
		if(specialized) {
			multiple_normalize_cast<T, N> <<<matrix_grid, matrix_block>>>
			(
				matrix_result_device, matrix_device, t_max_matrix_reduced,
				rows, cols, t_max_matrix_block.x
			);
		} else {
			multiple_normalize<T, N> <<<matrix_grid, matrix_block>>>
			(
				matrix_result_device, matrix_device, t_max_matrix_reduced,
				rows, cols, t_max_matrix_block.x, CastNormalizeMatrixOperation<T, N>()
			);
		}
	}

	CUDA_CHECK_RETURN(cudaDeviceSynchronize());
	CUDA_CHECK_RETURN(cudaFree(max_matrix_device));
	CUDA_CHECK_RETURN(cudaFree(matrix_device));
	CUDA_CHECK_RETURN(cudaFree(t_max_matrix_device));
	CUDA_CHECK_RETURN(cudaFree(t_max_matrix_reduced));

	//printf("\n\nresult_matrix_device\n\n");
	//CudaUtils::load_and_print<T, false>(matrix_result_device, rows, cols);
	//CudaUtils::load_and_print<T, false>(matrix_result_device, rows, cols, rows - 10, cols - 10);

	return matrix_result_device;
}

template <typename T, typename N, int max_threads, bool specialized>
N* apply_tf_idf_metrics(dim3 matrix_block, dim3 matrix_grid, T* matrix_device, int rows, int cols) {

	dim3 dfi_matrix_block(matrix_block), dfi_matrix_grid(matrix_grid);
	dim3 max_fj_matrix_block(matrix_block), max_fj_matrix_grid(matrix_grid);
	dim3 matrix_transpose_block(matrix_block), matrix_transpose_grid(matrix_grid);

	CudaUtils::compute_num_threads_blocks(matrix_transpose_grid, matrix_transpose_block, max_threads, rows, cols, true, false);
	CudaUtils::compute_num_threads_blocks(max_fj_matrix_grid, max_fj_matrix_block, max_threads, cols, rows, false, false);

	N* tf_idf_matrix_device = NULL;
	T* transposed_matrix_device = NULL;
	T* max_fj_matrix_device = NULL;

	//printf("TF_IDF (DFI_MAX)\n\n");
	// Para cada linha da matriz, o valor do dfi está na última coluna.
	T* dfi_matrix_device = apply_reduce_operation_line<T, SumReduceOperation<T>, DFISharedPositionSetter<T>, DefaultSharedPositionSetter<T>, specialized>
	(
		dfi_matrix_block, dfi_matrix_grid, matrix_device, rows, cols,
		SumReduceOperation<T>(), DFISharedPositionSetter<T>(), DefaultSharedPositionSetter<T>()
	);

	//printf("\n\n(dfi_matrix_device)\n\n");
	//CudaUtils::load_and_print<T, true>(dfi_matrix_device, rows, dfi_matrix_block.x);

	transposed_matrix_device = transpose_matrix<T, max_threads>(matrix_device, matrix_transpose_block, matrix_transpose_grid, rows, cols);

	//CudaUtils::load_and_print<int, true>(transposed_matrix_device, cols, rows, "%d ");

	// Para cada linha da matriz, o valor do max(fj) está na última coluna.
	// O número da coluna na matrix TxD indexa uma linha na matriz do max(fj)
	//printf("TF_IDF (MAX_FJ)\n\n");
	max_fj_matrix_device = apply_reduce_operation_line<T, MaxReduceOperation<T>, DefaultSharedPositionSetter<T>, specialized>
	(
		max_fj_matrix_block, max_fj_matrix_grid, transposed_matrix_device,
		cols, rows, MaxReduceOperation<T>(), DefaultSharedPositionSetter<T>()
	);

	CUDA_CHECK_RETURN(cudaFree(transposed_matrix_device));

	//printf("\n\n(max_fj_matrix)\n\n");
	//CudaUtils::load_and_print<T, true>(max_fj_matrix_device, cols, max_fj_matrix_block.x);
	
	CudaUtils::malloc_on_gpu<N, false>((void**) &tf_idf_matrix_device, rows, cols);
	
	if(typeid(T) == typeid(N)) {
		if(specialized) {
			transform_tf_idf_non_cast<T, N> <<<matrix_grid, matrix_block>>>
			(
				tf_idf_matrix_device, matrix_device, rows, cols,
				dfi_matrix_device, max_fj_matrix_device,
				dfi_matrix_block.x, max_fj_matrix_block.x
			);
		} else {
			transform_tf_idf<T, N> <<<matrix_grid, matrix_block>>>
			(
				tf_idf_matrix_device, matrix_device, rows, cols,
				dfi_matrix_device, max_fj_matrix_device,
				dfi_matrix_block.x, max_fj_matrix_block.x,
				NonCastTFIDFOperation<T, N>()
			);
		}
	} else {
		if(specialized) {
			transform_tf_idf_cast<T, N> <<<matrix_grid, matrix_block>>>
			(
				tf_idf_matrix_device, matrix_device, rows, cols,
				dfi_matrix_device, max_fj_matrix_device,
				dfi_matrix_block.x, max_fj_matrix_block.x
			);
		} else {
			transform_tf_idf<T, N> <<<matrix_grid, matrix_block>>>
			(
				tf_idf_matrix_device, matrix_device, rows, cols,
				dfi_matrix_device, max_fj_matrix_device,
				dfi_matrix_block.x, max_fj_matrix_block.x,
				CastTFIDFOperation<T, N>()
			);
		}
	}

	CUDA_CHECK_RETURN(cudaDeviceSynchronize());

	//CudaUtils::load_and_print<N, true>(tf_idf_matrix_device, rows, cols, rows - 10, cols - 10);

	CUDA_CHECK_RETURN(cudaFree(matrix_device));
	CUDA_CHECK_RETURN(cudaFree(dfi_matrix_device));
	CUDA_CHECK_RETURN(cudaFree(max_fj_matrix_device));

	return tf_idf_matrix_device;
}