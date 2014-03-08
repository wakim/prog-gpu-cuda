/*
 * CudaMatrixProcessorTimed.h
 *
 *  Created on: Jan 24, 2013
 *      Author: wakim
 */

#ifndef CUDAMATRIXPROCESSORTIMED_H_
#define CUDAMATRIXPROCESSORTIMED_H_

#include "MatrixProcessor.h"
#include "CudaTimer.h"
#include <cstdio>

namespace ProgGPU {

	namespace TimerFunctions {
		enum {
			LOAD_MATRIX_ON_GPU, LOAD_MATRIX_FROM_GPU,
			LOAD_NORMALIZED_MATRIX_FROM_GPU, NORMALIZE_MATRIX,
			APPLY_TF_IDF_METRICS, MULTIPLY_BY_TRANSPOSE,

			LAST
		};

		static const char* TimerFunctionNames[] = {
			"LOAD_MATRIX_ON_GPU", "LOAD_MATRIX_FROM_GPU",
			"LOAD_NORMALIZED_MATRIX_FROM_GPU", "NORMALIZE_MATRIX",
			"APPLY_TF_IDF_METRICS", "MULTIPLY_BY_TRANSPOSE"
		};
	}

	/**
	 * Decorator para medir o tempo de execução de cada método.
	 * O certo é ter uma interface mais alto nível que CudaMatrixProcessor
	 */
	template <typename T, typename N, int max_threads, bool specialized>
	class CudaMatrixProcessorTimed : public MatrixProcessor<T, N, max_threads, specialized> {
		public:
			CudaMatrixProcessorTimed(MatrixProcessor<T, N, max_threads, specialized>* _instance) : instance(_instance){
				memset(&times, 0, TimerFunctions::LAST * sizeof(float));
			}
			virtual ~CudaMatrixProcessorTimed(){ delete instance; }
			virtual void load_matrix_on_gpu();
			virtual void load_matrix_from_gpu();
			virtual void load_processed_matrix_from_gpu();
			virtual void normalize_tf_idf_matrix();
			virtual void apply_tf_idf_metrics();
			virtual void multiply_by_transpose();
			virtual inline void set_matrix(T* _matrix, T _rows, T _cols) {
				instance->set_matrix(_matrix, _rows, _cols);
			}
			virtual inline const T* get_matrix() const {return instance->get_matrix(); }
			virtual inline const N* get_processed_matrix() const { return instance->get_processed_matrix(); }
			virtual float get_sum_times();
		private:
			MatrixProcessor<T, N, max_threads, specialized>* instance;
			CudaUtils::CudaTimer timer;
			float times[TimerFunctions::LAST];
	};

} /* namespace ProgGPU */
#endif /* MATRIXPROCESSORTIMED_H_ */
