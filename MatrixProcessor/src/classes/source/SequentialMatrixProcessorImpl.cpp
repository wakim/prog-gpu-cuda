/*
 * CudaMatrixProcessor.cpp
 *
 *  Created on: Jan 21, 2013
 *      Author: wakim
 */

#include "../header/SequentialMatrixProcessorImpl.h"
#include <cmath>

namespace ProgGPU {

	//template <typename T, typename N, int max_threads, bool specialized>
	//void SequentialMatrixProcessorImpl<T, N, max_threads, specialized>::normalize_tf_idf_matrix() {
	//	N max_element = static_cast<N>(0);
		
	//	for(int i = 0; i < rows * cols; ++i) {
	//		if(processed_matrix_host[i] > max_element) {
	//			max_element = processed_matrix_host[i];
	//		}
	//	}

	//	if(max_element == static_cast<N>(0)) {
	//		return;
	//	}

	//	for(int i = 0; i < rows * cols; ++i) {
	//		processed_matrix_host[i] /= max_element;
	//	}
	//}

	//template <typename T, typename N, int max_threads, bool specialized>
	//void SequentialMatrixProcessorImpl<T, N, max_threads, specialized>::apply_tf_idf_metrics() {
		//T* dfi = get_dfi();
		//T* max_fj = get_max_fj();
		
		//processed_matrix_host = new N[rows * cols];
		
		//N tf, idf;

		//printf("dfi!!\n");
		//for(int i = 0; i < rows; ++i) {
		//	printf("%d ", dfi[i]);
		//}

		//printf("\n\n");
		//printf("max_fj!!\n");
		//for(int j = 0; j < cols; ++j) {
		//	printf("%d ", max_fj[j]);
		//}

		//for(int i = 0; i < rows; ++i) {
		//	for(int j = 0; j < cols; ++j) {

		//		if(max_fj[j] != static_cast<T>(0) && dfi[i] != static_cast<T>(0)) {
		//			tf = static_cast<N>(matrix_host[i * cols + j]) / static_cast<N>(max_fj[j]);
		//			idf = static_cast<N>(log10(static_cast<N>(cols) / static_cast<N>(dfi[i])));

		//			processed_matrix_host[i * cols + j] = tf * idf;
		//		} else {
		//			processed_matrix_host[i * cols + j] = static_cast<N>(0);
		//		}
		//	}
		//}

		//delete matrix_host;
		//delete dfi;
		//delete max_fj;

		//matrix_host = NULL;
	//}

	//template <typename T, typename N, int max_threads, bool specialized>
	//T* SequentialMatrixProcessorImpl<T, N, max_threads, specialized>::get_dfi(){
	//	T* dfi = new T[rows];

	//	int count = 0;
		
	//	for(int i = 0; i < rows; ++i) {
	//		for(int j = 0; j < cols; ++j) {
	//			count += !! static_cast<int>(matrix_host[i * cols + j]);
	//		}
	//		dfi[i] = static_cast<T>(count);
	//		count = 0;
	//	}

	//	return dfi;
	//}

	//template <typename T, typename N, int max_threads, bool specialized>
	//T* SequentialMatrixProcessorImpl<T, N, max_threads, specialized>::get_max_fj(){
	//	T* max_fj = new T[cols];

	//	T max_element = static_cast<T>(0);

	//	for(int j = 0; j < cols; ++j) {
	//		for(int i = 0; i < rows; ++i) {
	//			if( matrix_host[i * cols + j] >= max_element) {
	//				max_element = matrix_host[i * cols + j];
	//			}
	//		}
	//		max_fj[j] = max_element;
	//		max_element = static_cast<T>(0);
	//	}

	//	return max_fj;
	//}
} /* namespace ProgGPU */
