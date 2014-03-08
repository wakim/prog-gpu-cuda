/*
 * CudaMatrixProcessor.cpp
 *
 *  Created on: Jan 21, 2013
 *      Author: wakim
 */

#include "../header/CudaMatrixProcessorImpl.h"
#include "../../utils/cuda_utils.h"

namespace ProgGPU {

	//template <typename T, typename N, int max_threads, bool specialized>
	//void CudaMatrixProcessorImpl<T, N, max_threads, specialized>::load_matrix_on_gpu() {
	//	CudaUtils::malloc_on_gpu<T, false>((void**) &matrix_device, rows, cols);
	//	CUDA_CHECK_RETURN(cudaMemcpy(matrix_device, matrix_host, size_of_matrix, cudaMemcpyHostToDevice));
	//	CudaUtils::compute_num_threads_blocks(grid, block, max_threads, rows, cols);
	//}

	//template <typename T, typename N, int max_threads, bool specialized>
	//void CudaMatrixProcessorImpl<T, N, max_threads, specialized>::load_matrix_from_gpu() {
	//	if(matrix_device != NULL) {
	//		CUDA_CHECK_RETURN(cudaMemcpy(matrix_host, matrix_device, size_of_matrix, cudaMemcpyDeviceToHost));
	//	}
	//}
	
	//template <typename T, typename N, int max_threads, bool specialized>
	//void CudaMatrixProcessorImpl<T, N, max_threads, specialized>::load_processed_matrix_from_gpu() {
	//	if(processed_matrix_device != NULL) {
	//		try {
	//			processed_matrix_host = new N[rows * cols];
	//		} catch(std::exception& e) {
	//			fprintf(stderr, "Erro ao alocar memoria para a matriz %s", e.what());
	//			return;
	//		}
	//		CUDA_CHECK_RETURN(cudaMemcpy(processed_matrix_host, processed_matrix_device, size_of_processed_matrix, cudaMemcpyDeviceToHost));
	//	}
	//}

	//template <typename T, typename N, int max_threads, bool specialized>
	//void CudaMatrixProcessorImpl<T, N, max_threads, specialized>::normalize_tf_idf_matrix() {
	//	processed_matrix_device = ::normalize_matrix_kernel_wrapper<N, N, max_threads>(block, grid, processed_matrix_device, rows, cols);
	//}

	//template <typename T, typename N, int max_threads, bool specialized>
	//void CudaMatrixProcessorImpl<T, N, max_threads, specialized>::apply_tf_idf_metrics() {
	//	processed_matrix_device = ::apply_tf_idf_metrics<T, N, max_threads>(block, grid, matrix_device, rows, cols);

		// Nesse ponto, a matrix original foi consumida pelo kernel e devidamente liberada da GPU.
	//	delete matrix_host;
	//	matrix_host = NULL;
	//	matrix_device = NULL;
	//}

} /* namespace ProgGPU */
