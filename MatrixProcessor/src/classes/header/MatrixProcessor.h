
#ifndef MATRIXPROCESSOR_H_
#define MATRIXPROCESSOR_H_

namespace ProgGPU {
	template <typename T, typename N, int max_threads, bool specialized>
	class MatrixProcessor {
	public:
		virtual ~MatrixProcessor() {};
		virtual void set_matrix(T* _matrix, T _rows, T _cols) = 0;
		virtual const T* get_matrix() const = 0;
		virtual const N* get_processed_matrix() const = 0;

		/**
		 * Carrega a matriz da memória do Host para a memória da GPU
		 */
		virtual void load_matrix_on_gpu() = 0;
		/**
		 * Carrega a matriz da memória da GPU para a memória do Host
		 */
		virtual void load_matrix_from_gpu() = 0;
		/**
		 * Carrega a matriz normalizada da memória da GPU para a memória do Host
		 */
		virtual void load_processed_matrix_from_gpu() = 0;
		/***
		 * Normaliza a matriz que já está na memória da GPU.
		 * A matriz anterior é liberada da memória.
		 * A matriz resultante permanece na memória da GPU.
		 */
		virtual void normalize_tf_idf_matrix() = 0;
		/***
		 * Transforma a matriz normalizada que esta na GPU
		 * Na matriz com cada célula tendo o valor do tf-idf.
		 * A matriz resultante permanece na memória da GPU.
		 */
		virtual void apply_tf_idf_metrics() = 0;
		/***
		 * Realiza a multiplicacao da matriz normalizada (nas métricas de tf-idf ou não)
		 * pela trasposta.
		 * A matriz resultante permanece na memória da GPU.
		 */
		virtual void multiply_by_transpose() = 0;
	};
}
#endif /* MATRIXPROCESSORIMPL_H_ */
