/*
 * CudaMatrixProcessorTimed.cpp
 *
 *  Created on: Jan 24, 2013
 *      Author: wakim
 */

#include "../header/CudaMatrixProcessorTimed.h"

namespace ProgGPU {

	template
	CudaMatrixProcessorTimed<int, float, 912, true>::~CudaMatrixProcessorTimed();

	template
	CudaMatrixProcessorTimed<int, double, 912, true>::~CudaMatrixProcessorTimed();

	template
	CudaMatrixProcessorTimed<int, float, 912, false>::~CudaMatrixProcessorTimed();

	template
	CudaMatrixProcessorTimed<int, double, 912, false>::~CudaMatrixProcessorTimed();

	template
	CudaMatrixProcessorTimed<int, float, 896, true>::~CudaMatrixProcessorTimed();

	template
	CudaMatrixProcessorTimed<int, double, 896, true>::~CudaMatrixProcessorTimed();

	template
	CudaMatrixProcessorTimed<int, float, 896, false>::~CudaMatrixProcessorTimed();

	template
	CudaMatrixProcessorTimed<int, double, 896, false>::~CudaMatrixProcessorTimed();

	template
	CudaMatrixProcessorTimed<int, float, 768, true>::~CudaMatrixProcessorTimed();

	template
	CudaMatrixProcessorTimed<int, double, 768, true>::~CudaMatrixProcessorTimed();

	template
	CudaMatrixProcessorTimed<int, float, 768, false>::~CudaMatrixProcessorTimed();

	template
	CudaMatrixProcessorTimed<int, double, 768, false>::~CudaMatrixProcessorTimed();

	template
	CudaMatrixProcessorTimed<int, float, 512, true>::~CudaMatrixProcessorTimed();

	template
	CudaMatrixProcessorTimed<int, double, 512, true>::~CudaMatrixProcessorTimed();

	template
	CudaMatrixProcessorTimed<int, float, 512, false>::~CudaMatrixProcessorTimed();

	template
	CudaMatrixProcessorTimed<int, double, 512, false>::~CudaMatrixProcessorTimed();

	template
	CudaMatrixProcessorTimed<int, float, 256, true>::~CudaMatrixProcessorTimed();

	template
	CudaMatrixProcessorTimed<int, double, 256, true>::~CudaMatrixProcessorTimed();

	template
	CudaMatrixProcessorTimed<int, float, 256, false>::~CudaMatrixProcessorTimed();

	template
	CudaMatrixProcessorTimed<int, double, 256, false>::~CudaMatrixProcessorTimed();

	template <typename T, typename N, int max_threads, bool specialized>
	void CudaMatrixProcessorTimed<T, N, max_threads, specialized>::load_matrix_on_gpu() {
		timer.start();

		instance->load_matrix_on_gpu();

		float elapsed_time = timer.stop();
		times[TimerFunctions::LOAD_MATRIX_ON_GPU] = elapsed_time;
	}

	template <typename T, typename N, int max_threads, bool specialized>
	void CudaMatrixProcessorTimed<T, N, max_threads, specialized>::load_matrix_from_gpu() {
		timer.start();

		instance->load_matrix_from_gpu();

		float elapsed_time = timer.stop();
		times[TimerFunctions::LOAD_MATRIX_FROM_GPU] = elapsed_time;
	}

	template <typename T, typename N, int max_threads, bool specialized>
	void CudaMatrixProcessorTimed<T, N, max_threads, specialized>::load_processed_matrix_from_gpu() {
		timer.start();

		instance->load_processed_matrix_from_gpu();

		float elapsed_time = timer.stop();
		times[TimerFunctions::LOAD_NORMALIZED_MATRIX_FROM_GPU] = elapsed_time;
	}

	template <typename T, typename N, int max_threads, bool specialized>
	void CudaMatrixProcessorTimed<T, N, max_threads, specialized>::normalize_tf_idf_matrix() {
		timer.start();

		instance->normalize_tf_idf_matrix();

		float elapsed_time = timer.stop();
		times[TimerFunctions::NORMALIZE_MATRIX] = elapsed_time;
	}

	template <typename T, typename N, int max_threads, bool specialized>
	void CudaMatrixProcessorTimed<T, N, max_threads, specialized>::multiply_by_transpose() {
		timer.start();

		instance->multiply_by_transpose();

		float elapsed_time = timer.stop();
		times[TimerFunctions::MULTIPLY_BY_TRANSPOSE] = elapsed_time;
	}

	template <typename T, typename N, int max_threads, bool specialized>
	void CudaMatrixProcessorTimed<T, N, max_threads, specialized>::apply_tf_idf_metrics() {
		timer.start();

		instance->apply_tf_idf_metrics();

		float elapsed_time = timer.stop();
		times[TimerFunctions::APPLY_TF_IDF_METRICS] = elapsed_time;
	}

	template <typename T, typename N, int max_threads, bool specialized>
	float CudaMatrixProcessorTimed<T, N, max_threads, specialized>::get_sum_times() {
		float sum = 0.0f;

		printf("\n\n\nMetricas obtidas\n");
		for(int i = 0; i < TimerFunctions::LAST; ++i) {
			printf("%s - %f ms\n", TimerFunctions::TimerFunctionNames[i], times[i]);
			sum += times[i];
		}

		return sum;
	}
} /* namespace ProgGPU */
