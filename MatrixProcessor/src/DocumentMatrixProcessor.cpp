#include <stdio.h>
#include <ctime>

#include "classes/header/MatrixReader.h"
#include "classes/header/MatrixProcessor.h"
#include "classes/header/CudaMatrixProcessorTimed.h"
#include "classes/header/CudaMatrixProcessorImpl.h"
#include "classes/header/SequentialMatrixProcessorImpl.h"

#ifdef _WIN32 | _WIN64
	#define WAIT getchar();
#else
	#define WAIT
#endif

const static char* bases[] = {
	"cf_12176_1225", "reuters215780.1", "tipster_doe_17550_2232",
	"tipster_fr_33519_1981", "tipster_wsj_47497_4649", "tipster_ziff_38004_4259"
};

// Valores possíveis para max_thread, para incluir mais valores e preciso especializar o CudaMatrixProcessorTimed e o kernels.cu.h
const static int max_threads_values[] = { 256, 512, 768, 896, 912 }; // Esses sao os valores que a gpu consegue trabalhar, mais que isso ele nao processa nada.

// Bases que foram processadas ate 912 (0, 1, e 2). Os resultados foram bons. A maior diferenca foi de 50% de ganho em relacao a base 2.
// As bases 3, 4, 5 nao conseguem ser processadas por estarem muito grande.

/**
	Specialized indica se será utilizado kernels específicos para cada etapa
	ou utilizar templates para reutilizar kernels
**/
const static bool specialized = true;
const static int max_threads = 912;
const static int base_index = 2;
ProgGPU::CudaMatrixProcessorTimed<int, float, max_threads, specialized>* get_instance(const char* type) {
	if(strlen(type) != 3) {
		printf("Tipo nao reconhecido !\n");
		exit(EXIT_FAILURE);
	}

	if(strncmp("PAR", type, 3) == 0) {
		return new ProgGPU::CudaMatrixProcessorTimed<int, float, max_threads, specialized>(new ProgGPU::CudaMatrixProcessorImpl<int, float , max_threads, specialized>());
	} else if(strncmp("SEQ", type, 3) == 0) {
		return new ProgGPU::CudaMatrixProcessorTimed<int, float, max_threads, specialized>(new ProgGPU::SequentialMatrixProcessorImpl<int, float , max_threads, specialized>());
	} else {
		printf("Tipo nao reconhecido !\n");
		exit(EXIT_FAILURE);
	}
}

int main(int argc, char** argv) {
	clock_t start, stop;
	int rows, cols;
	int *matrix;
	char *type = "SEQ";

	if(argc >= 2) {
		type = argv[1];
	}

	ProgGPU::MatrixReader<int> reader(bases[base_index]);
	ProgGPU::MatrixProcessor<int, float, max_threads, specialized>* processor = get_instance(type);
	ProgGPU::CudaMatrixProcessorTimed<int, float, max_threads, specialized> *real_processor = static_cast<ProgGPU::CudaMatrixProcessorTimed<int, float, max_threads, specialized>*>(processor);

	start = clock();

	reader.open();

	matrix = reader.read(rows, cols);
	reader.close();

	if(matrix == NULL) {
		exit(EXIT_FAILURE);
	}

	printf("%s %s %d %d %d %s\n", type, typeid(processor).name(), rows, cols, rows * cols, bases[base_index]);

	//exit(1);

	// 100 Só para limitar o debug
	/*/
	rows = 60;
	cols = 40;
	int start_row = 0;
	int start_col = 0;
	int end_row = rows;
	int end_col = cols;
	/*/
	int start_row = rows-  10;
	int start_col =  cols - 10;
	int end_row = rows;
	int end_col = cols;
	//*/

	//for(int i = start_row; i < rows; ++i) {
	//	printf("%d) ", i);
	//	for(int j = start_col; j < cols; ++j) {
	//		printf("%d ", matrix[i * cols + j]);
	//	}
	//	printf("\n");
	//}

	processor->set_matrix(matrix, rows, cols);
	processor->load_matrix_on_gpu();
	
	processor->apply_tf_idf_metrics();
	processor->normalize_tf_idf_matrix();
	processor->load_processed_matrix_from_gpu();

	const float* normalized_matrix = processor->get_processed_matrix();

	printf("normalizada-------------normalizada\n");
	for(int i = start_row; i < end_row; ++i) {
		for(int j = start_col; j < end_col; ++j) {
			printf("%1.2f ", normalized_matrix[i * cols + j]);
		}
		printf("\n");
	}

	stop = clock();

	float time = real_processor->get_sum_times();
	double diff_time = ((double)(stop - start)) / CLOCKS_PER_SEC;

	printf("Tempo total gasto na gpu: %f ms\n", time);
	printf("Tempo total gasto na cpu: %lf ms\n", diff_time * 1000.0);
	delete processor;
	
	WAIT
	return 0;
}
