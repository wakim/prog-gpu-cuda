/*
 * CudaMatrixProcessor.h
 *
 *  Created on: Jan 21, 2013
 *      Author: wakim
 */

#ifndef SEQUENTIALMATRIXPROCESSORIMPL_H_
#define SEQUENTIALMATRIXPROCESSORIMPL_H_

#include <stdio.h>
#include <exception>
#include "MatrixProcessor.h"

namespace ProgGPU {

	/**
	 * T é o tipo que é carregado do disco.
	 * N é o tipo depois da matriz ser normalizada
	 */
	template <typename T, typename N, int max_threads, bool specialized>
	class SequentialMatrixProcessorImpl : public MatrixProcessor<T, N, max_threads, specialized> {
	private:
		T* matrix_host;
		N* processed_matrix_host;
		int cols, rows;
	private:
		T* get_dfi() {
			T* dfi = new T[rows];

			int count = 0;
		
			for(int i = 0; i < rows; ++i) {
				for(int j = 0; j < cols; ++j) {
					count += !! static_cast<int>(matrix_host[i * cols + j]);
				}
				dfi[i] = static_cast<T>(count);
				count = 0;
			}

			return dfi;
		}
		T* get_max_fj() {
			T* max_fj = new T[cols];

			T max_element = static_cast<T>(0);

			for(int j = 0; j < cols; ++j) {
				for(int i = 0; i < rows; ++i) {
					if( matrix_host[i * cols + j] >= max_element) {
						max_element = matrix_host[i * cols + j];
					}
				}
				max_fj[j] = max_element;
				max_element = static_cast<T>(0);
			}

			return max_fj;
		}
	public:
		SequentialMatrixProcessorImpl(T* _matrix) : processed_matrix_host(NULL), matrix_host(_matrix) {}
		SequentialMatrixProcessorImpl() : processed_matrix_host(NULL), matrix_host(NULL) {}
		virtual ~SequentialMatrixProcessorImpl() {
			if(matrix_host != NULL) {
				delete matrix_host;
			}

			if(processed_matrix_host != NULL) {
				delete processed_matrix_host;
			}
		}
		virtual inline void set_matrix(T* _matrix, T _rows, T _cols) {
			matrix_host = _matrix;
			rows = static_cast<int>(_rows);
			cols = static_cast<int>(_cols);
		}
		virtual inline const T* get_matrix() const {return matrix_host; }
		virtual inline const N* get_processed_matrix() const { return processed_matrix_host; }
		/**
		 * Nao faz nada
		 */
		virtual void load_matrix_on_gpu() {}
		/**
		 * Nao faz nada
		 */
		virtual void load_matrix_from_gpu() {}
		/**
		 * Nao faz nada
		 */
		virtual void load_processed_matrix_from_gpu() {}
		/***
		 * Normaliza a matriz tf-idf
		 */
		virtual void normalize_tf_idf_matrix() {
			N max_element = static_cast<N>(0);
		
			for(int i = 0; i < rows * cols; ++i) {
				if(processed_matrix_host[i] > max_element) {
					max_element = processed_matrix_host[i];
				}
			}

			if(max_element == static_cast<N>(0)) {
				return;
			}

			for(int i = 0; i < rows * cols; ++i) {
				processed_matrix_host[i] /= max_element;
			}
		}
		/***
		 * Transforma a matriz TxD na matriz com as metricas tf-idf
		 */
		virtual void apply_tf_idf_metrics() {
			T* dfi = get_dfi();
			T* max_fj = get_max_fj();
		
			processed_matrix_host = new N[rows * cols];
		
			N tf, idf;

			//printf("dfi!!\n");
			//for(int i = 0; i < rows; ++i) {
			//	printf("%d ", dfi[i]);
			//}

			//printf("\n\n");
			//printf("max_fj!!\n");
			//for(int j = 0; j < cols; ++j) {
			//	printf("%d ", max_fj[j]);
			//}

			for(int i = 0; i < rows; ++i) {
				for(int j = 0; j < cols; ++j) {

					if(max_fj[j] != static_cast<T>(0) && dfi[i] != static_cast<T>(0)) {
						tf = static_cast<N>(matrix_host[i * cols + j]) / static_cast<N>(max_fj[j]);
						idf = static_cast<N>(log10(static_cast<N>(cols) / static_cast<N>(dfi[i])));

						processed_matrix_host[i * cols + j] = tf * idf;
					} else {
						processed_matrix_host[i * cols + j] = static_cast<N>(0);
					}
				}
			}

			delete matrix_host;
			delete dfi;
			delete max_fj;

			matrix_host = NULL;
		}
		/***
		 * Realiza a multiplicacao da matriz normalizada (nas métricas de tf-idf ou não)
		 * pela trasposta.
		 */
		virtual void multiply_by_transpose() {}
	};

} /* namespace ProgGPU */
#endif /* SEQUENTIALMATRIXPROCESSORIMPL_H_ */
