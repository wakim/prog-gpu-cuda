/*
 * CudaMatrixProcessor.h
 *
 *  Created on: Jan 21, 2013
 *      Author: wakim
 */

#ifndef CUDAMATRIXPROCESSORIMPL_H_
#define CUDAMATRIXPROCESSORIMPL_H_

#include <stdio.h>
#include <exception>
#include "MatrixProcessor.h"
#include <cuda.h>
#include <cuda_runtime.h>
#include "../../cuda/kernels.cu.h"

namespace ProgGPU {

	/**
	 * T é o tipo que é carregado do disco.
	 * N é o tipo depois da matriz ser normalizada
	 */
	template <typename T, typename N, int max_threads, bool specialized>
	class CudaMatrixProcessorImpl : public MatrixProcessor<T, N, max_threads, specialized> {
	private:
			T* matrix_host, *matrix_device;
			N* processed_matrix_host, *processed_matrix_device;
			int cols, rows;
			dim3 block, grid;
			size_t size_of_matrix, size_of_processed_matrix;
	public:
		CudaMatrixProcessorImpl(T* _matrix) : processed_matrix_device(NULL), processed_matrix_host(NULL),
			matrix_device(NULL), matrix_host(_matrix) {}
		CudaMatrixProcessorImpl() : processed_matrix_device(NULL), processed_matrix_host(NULL),
			matrix_device(NULL), matrix_host(NULL) {}
		virtual ~CudaMatrixProcessorImpl() {
			if(matrix_host != NULL) {
				delete matrix_host;
			}

			if(matrix_device != NULL) {
				CUDA_CHECK_RETURN(cudaFree(matrix_device));
			}

			if(processed_matrix_host != NULL) {
				delete processed_matrix_host;
			}

			if(processed_matrix_device != NULL) {
				CUDA_CHECK_RETURN(cudaFree(processed_matrix_device));
			}
		}
		virtual inline void set_matrix(T* _matrix, T _rows, T _cols) {
			matrix_host = _matrix;
			rows = static_cast<int>(_rows);
			cols = static_cast<int>(_cols);
			size_of_matrix = rows * cols * sizeof(T);
			size_of_processed_matrix = rows * cols * sizeof(N);
		}
		virtual inline const T* get_matrix() const {return matrix_host; }
		virtual inline const N* get_processed_matrix() const { return processed_matrix_host; }
		/**
		 * Carrega a matriz da memória do Host para a memória da GPU
		 */
		virtual void load_matrix_on_gpu() {
			CudaUtils::malloc_on_gpu<T, false>((void**) &matrix_device, rows, cols);
			CUDA_CHECK_RETURN(cudaMemcpy(matrix_device, matrix_host, size_of_matrix, cudaMemcpyHostToDevice));
			CudaUtils::compute_num_threads_blocks(grid, block, max_threads, rows, cols);
		}
		/**
		 * Carrega a matriz da memória da GPU para a memória do Host
		 */
		virtual void load_matrix_from_gpu() {
			if(matrix_device != NULL) {
				CUDA_CHECK_RETURN(cudaMemcpy(matrix_host, matrix_device, size_of_matrix, cudaMemcpyDeviceToHost));
			}
		}
		/**
		 * Carrega a matriz normalizada da memória da GPU para a memória do Host
		 */
		virtual void load_processed_matrix_from_gpu() {
			if(processed_matrix_device != NULL) {
				try {
					processed_matrix_host = new N[rows * cols];
				} catch(std::exception& e) {
					fprintf(stderr, "Erro ao alocar memoria para a matriz %s", e.what());
					return;
				}
				CUDA_CHECK_RETURN(cudaMemcpy(processed_matrix_host, processed_matrix_device, size_of_processed_matrix, cudaMemcpyDeviceToHost));
			}
		}
		/***
		 * Normaliza a matriz que já está na memória da GPU.
		 * A matriz anterior é liberada da memória.
		 * A matriz resultante permanece na memória da GPU.
		 */
		virtual inline void normalize_tf_idf_matrix() {
			processed_matrix_device = ::normalize_matrix_kernel_wrapper<N, N, max_threads, specialized>(
				block, grid, processed_matrix_device, rows, cols
			);
		}
		/***
		 * Transforma a matriz que esta na GPU
		 * Na matriz com cada célula tendo o valor do tf-idf.
		 * A matriz resultante permanece na memória da GPU.
		 */
		virtual void apply_tf_idf_metrics() {
			processed_matrix_device = ::apply_tf_idf_metrics<T, N, max_threads, specialized>(
				block, grid, matrix_device, rows, cols
			);

			// Nesse ponto, a matrix original foi consumida pelo kernel e devidamente liberada da GPU.
			delete matrix_host;
			matrix_host = NULL;
			matrix_device = NULL;
		}
		/***
		 * Realiza a multiplicacao da matriz normalizada (nas métricas de tf-idf ou não)
		 * pela trasposta.
		 * A matriz resultante permanece na memória da GPU.
		 */
		virtual void multiply_by_transpose() {}
	};

} /* namespace ProgGPU */
#endif /* CUDAMATRIXPROCESSORIMPL_H_ */
