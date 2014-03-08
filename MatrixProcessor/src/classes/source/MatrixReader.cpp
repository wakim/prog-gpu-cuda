#include "../header/MatrixReader.h"

namespace ProgGPU {

	template
	MatrixReader<int>::~MatrixReader();

	template
	void MatrixReader<int>::open();

	template
	int* MatrixReader<int>::read(int &rows, int &cols);

	template
	void MatrixReader<int>::close();

	template <typename T>
	MatrixReader<T>::~MatrixReader() {
		close();
	}

	template <typename T>
	void MatrixReader<T>::open() {
		/*
		errno_t my_errno = open_file(fd, path, O_RDONLY);

		if(fd == -1) {
			fprintf(stderr, "Erro ao abrir arquivo %d %s\n", my_errno, path);
			print_error_string(my_errno);
			return;

		printf("filesize %ld bytes\n", get_file_size(fd));

		*/

		f = fopen(path, "r");
		
		long size = get_file_size(f);
		long size_k = size / 1024, size_m = size_k / 1024;
		printf("file size bytes %ld kbytes %ld mbytes %ld\n", size, size_k, size_m);
		closed = false;
	}

	template <typename T>
	void MatrixReader<T>::close() {
		if(! closed) {
			/*
			if(::file_close(fd) == -1) {
				fprintf(stderr, "Erro ao fechar arquivo %d\n", errno);
				print_error_string(errno);
				return;
			}
			*/
			fclose(f);
			closed = true;
		}
	}

	template<typename T>
	T* MatrixReader<T>::read(T& rows, T& cols) {
		T matrix_size, matrix_size_bytes;

		/*
		if(::file_read(fd, &rows, sizeof(T)) != sizeof(T)) {
			fprintf(stderr, "Erro ao ler o numero de linhas %d\n", errno);
			print_error_string(errno);
			return NULL;
		}

		if(::file_read(fd, &cols, sizeof(T)) != sizeof(T)) {
			fprintf(stderr, "Erro ao ler o numero de colunas %d\n", errno);
			print_error_string(errno);
			return NULL;
		}
		*/

		fread(&rows, sizeof(T), 1, f);
		fread(&cols, sizeof(T), 1, f);

		matrix_size = cols * rows;
		matrix_size_bytes = matrix_size * sizeof(T);

		if(rows <= 0 || cols <= 0) {
			fprintf(stderr, "Erro na configuracao de linha e coluna\n");
			return NULL;
		}

		T* result = NULL;

		try {
			result = new T[matrix_size];
		} catch(std::exception& e) {
			fprintf(stderr, "Erro ao alocar memoria para a matriz %s\n", e.what());
			return NULL;
		}

		/*
		int bytes_read = ::file_read(fd, result, matrix_size_bytes);
		int current_read = bytes_read;
		T* result_runner = result;

		int iterations = 0;
		while(bytes_read != matrix_size_bytes) {
			result_runner = result_runner + (current_read / sizeof(T));
			current_read = ::file_read(fd, result_runner, matrix_size_bytes);
			iterations++;

			if(current_read == 0 && bytes_read != matrix_size_bytes) {
				fprintf(stderr, "Erro ao ler a matriz do arquivo (Lidos %d, Total %d) %d iteracao %d\n",
					bytes_read, matrix_size_bytes, errno, iterations
				);
				print_error_string(errno);
				return NULL;
			}
		}
		*/
		fread(result, sizeof(T), rows * cols, f);

		return result;
	}
}
