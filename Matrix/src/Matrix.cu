// Programação Paralela e Distribuída (Programação paralela em GPUs) (MAB622) (DCC/UFRJ)
// Outubro de 2012
// Prof.: Silvana Rossetto
// Laboratório 1: Introducao ao ambiente de programação CUDA no Linux

// Multiplica duas float*es: A * B = C

#include <cstdlib>
#include <cstdio>
#include <cmath>
#include <cstring>

// Thread block size
const int BLOCK_SIZE = 16;
const int SHARED_SIZE = 16;
const int WA = 1024; // Matrix A width
const int HA = 1024; // Matrix A height
const int WB = HA;// Matrix B width
const int HB = WA; // Matrix B height
const int WC = WA; // Matrix C width
const int HC = HB; // Matrix C height

const int CUDA_COALESC = 1;
const int CUDA = 2;

#define CUDA_CHECK_RETURN(value) {											\
	cudaError_t _m_cudaStat = value;										\
	if (_m_cudaStat != cudaSuccess) {										\
		fprintf(stderr, "Error %s at line %d in file %s\n",					\
				cudaGetErrorString(_m_cudaStat), __LINE__, __FILE__);		\
		exit(1);															\
	} }

////////////////////////// CUDA Kernel /////////////////////////
__global__ void
matrix_mult_coalesc(float* C, float* A, float* B, int width, int height) {
	__shared__ float As[SHARED_SIZE][SHARED_SIZE];
	__shared__ float Bs[SHARED_SIZE][SHARED_SIZE];

	int bx = blockIdx.x, by = blockIdx.y;
	int tx = threadIdx.x, ty = threadIdx.y;

	int row = by * BLOCK_SIZE + ty;
	int col = bx * BLOCK_SIZE + tx;
	int gridDimX = width / BLOCK_SIZE;

	float elementC = 0.0;
	for(int m = 0; m < gridDimX; ++m) {
		if(row < height && col < width) {
			As[ty][tx] = A[(row * width) + (m * BLOCK_SIZE + tx)];
			Bs[ty][tx] = B[(m * BLOCK_SIZE + ty) * width + col];
		}
		__syncthreads();
		if(row < height && col < width) {
			for(int k = 0; k < BLOCK_SIZE; ++k) {
				elementC += As[ty][k] * Bs[k][tx];
			}
		}
		__syncthreads();
	}

	// Write the matrix to device memory each
	// thread writes one element
	C[row * width + col] = elementC;
}

__global__ void
matrix_mult(float *c, float *a, float *b, int width, int height) {
	int line = blockIdx.y * blockDim.y + threadIdx.y;
	int column = blockIdx.x * blockDim.x + threadIdx.x;
	float c_element = 0;

	if(line >= height || column >= width) {
		return;
	}

	for(int k = 0; k < width; ++k) {
		c_element += a[line * width + k] * b[k * width + column];
	}

	c[line * width + column] = c_element;
}

// Inicializa uma float* de float (inteiros consecutivos)
void initMat(float* data, size_t size, int mod) {
	int _mod = 13 + ((mod % 2 == 0) ? (mod + 1) : mod);

	for (int i = 0; i < size; ++i) {
		data[i] = (float)(i % _mod) + 1;
	}
}

void fprintMat(FILE* input, float* data, size_t size, int w) {
	for(int i = 0; i < size; ++i) {
		fprintf(input, "%f ", data[i]);
		if(((i + 1) % w) == 0) {
			fprintf(input, "\n");
		}
	}
}

// Imprime uma float* de float
void printMat(float* data, size_t size, int w) {
	fprintMat(stdin, data, size, w);
}

float* fscanMat(FILE* input, size_t size) {
	float* m = (float*) malloc(sizeof(float) * size);

	for(int i = 0; i < size; ++i) {
		fscanf(input, "%f", m+i);
	}

	return m;
}

float* scanMat(size_t size) {
	return fscanMat(stdin, size);
}

//funcao main
int main(int argc, char** argv) {
	if(argc < 2) {
		printf("Usage: %s <algorithm> <debug opcional>\nalgorithm:\n\t c (Cuda)\n\t cc (Cuda Coalesc)\n", argv[0]);
		return -1;
	}

	const int debug = (argc > 2 ? strcmp("debug", argv[2]) == 0 : 0);

	int state = -1;
	//1. aloca memoria para as float*es de entrada A e B no host
	size_t size_A = WA * HA;
	size_t mem_size_A = sizeof(float) * size_A;
	float* h_A = (float*) malloc(mem_size_A);

	size_t size_B = WB * HB;
	size_t mem_size_B = sizeof(float) * size_B;
	float* h_B = (float*) malloc(mem_size_B);

	FILE* f_A = NULL;
	FILE* f_B = NULL;
	FILE* f_C = NULL;

	if(strlen(argv[1]) == 1 && strncmp("c", argv[1], 1) == 0) {
		state = CUDA;
		if(debug) {
			f_A = fopen("m_A_c.txt", "w");
			f_B = fopen("m_B_c.txt", "w");
			f_C = fopen("m_C_c.txt", "w");
		}
	} else if(strncmp("cc", argv[1], 2) == 0) {
		state = CUDA_COALESC;
		if(debug) {
			f_A = fopen("m_A_cc.txt", "w");
			f_B = fopen("m_B_cc.txt", "w");
			f_C = fopen("m_C_cc.txt", "w");
		}
	}

	//2. inicializa as float'es de entrada
	initMat(h_A, size_A, WA);

	initMat(h_B, size_B, WB);

	//3. (opcional) imprime as float*es de entrada
	if(debug) {
		fprintMat(f_A, h_A, size_A, WA);
		fprintMat(f_B, h_B, size_B, WB);
	}

	//4. aloca memoria para a float* de saida C no host
	unsigned int size_C = WC * HC;
	unsigned int mem_size_C = sizeof(float) * size_C;
	float* h_C = (float*) malloc(mem_size_C);

	//5. aloca memoria no device para as tres float*es (A, B e C)
	float* d_A;
	float* d_B;
	float* d_C;

	CUDA_CHECK_RETURN(cudaMalloc((void**) &d_A, mem_size_A));
	CUDA_CHECK_RETURN(cudaMalloc((void**) &d_B, mem_size_B));
	CUDA_CHECK_RETURN(cudaMalloc((void**) &d_C, mem_size_C));

	//6. copia as float*es de entrada do host para o device
	CUDA_CHECK_RETURN(cudaMemcpy(d_A, h_A, mem_size_A, cudaMemcpyHostToDevice));
	CUDA_CHECK_RETURN(cudaMemcpy(d_B, h_B, mem_size_B, cudaMemcpyHostToDevice));

	//7. executa a multiplicacao
	// seta os parametros de configuracao do kernel
	dim3 threads(BLOCK_SIZE, BLOCK_SIZE);
	dim3 grid(WC/threads.x, HC/threads.y);

	grid.x = (grid.x == 0 ? 1 : grid.x);
	grid.y = (grid.y == 0 ? 1 : grid.y);

	// executa o kernel
	if(state == CUDA) {
		matrix_mult<<<grid, threads>>>(d_C, d_A, d_B, WC, HC);
	} else {
		matrix_mult_coalesc<<<grid, threads>>>(d_C, d_A, d_B, WC, HC);
	}

	CUDA_CHECK_RETURN(cudaGetLastError());

	//8. copia os resultados do device para o host
	CUDA_CHECK_RETURN(cudaMemcpy(h_C, d_C, mem_size_C, cudaMemcpyDeviceToHost));

	//9. imprime a float* de saida
	if(debug) {
		fprintMat(f_C, h_C, size_C, WC);
		fclose(f_A);
		fclose(f_B);
		fclose(f_C);
	}

	//10. libera os espacos de memoria
	free(h_A);
	free(h_B);
	free(h_C);

	CUDA_CHECK_RETURN(cudaFree(d_A));
	CUDA_CHECK_RETURN(cudaFree(d_B));
	CUDA_CHECK_RETURN(cudaFree(d_C));
}
