/*
 * MatrixReader.h
 *
 *  Created on: Jan 20, 2013
 *      Author: wakim
 */

#ifndef MATRIXREADER_H_
#define MATRIXREADER_H_

#include <stdio.h>
#include <fcntl.h>

#ifdef __linux__
	#include <unistd.h>
	#define error_to_string strerror
	#define file_open open
	#define file_read read
	#define file_close close
#elif _WIN32 | _WIN64
	#include "../../utils/unistd_win.h"
	#include <share.h>	
	#define error_to_string strerror_s
	#define file_open _sopen_s
	#define file_read _read
	#define file_close _close
	#define WINDOWS 1
#endif
#include <sys/types.h>
#include <sys/stat.h>
#include <errno.h>
#include <string.h>
#include <exception>
#include "../../utils/cuda_utils.h"

namespace ProgGPU {
	template <class T>
	class MatrixReader {
		int fd;
		FILE *f;
		const char *path;
		bool closed;
	public:
		MatrixReader() : fd(-1), closed(true), path(NULL) {};
		MatrixReader(const char *_path) : fd(-1), closed(true), path(_path) {};
		virtual ~MatrixReader();
		void open();
		T* read(T& rows, T& cols);
		void close();
	};

	inline errno_t open_file(int &fd, const char* name, int flags) {
		errno_t my_errno = 0;
		#ifdef WINDOWS
			errno = _sopen_s(&fd, name, flags, _SH_DENYRW, 0);
			return errno;
		#else
			fd = open(name, flags);
			return errno;
		#endif
	}
	
	inline long get_file_size(FILE *f) {
		int fd = _fileno(f);
		#ifdef WINDOWS
			struct _stat buffer;
			errno = _fstat(fd, &buffer);
			return buffer.st_size;
		#else
			struct stat buffer;
			fstat(fd, &buffer);
			return buffer.st_size;
		#endif
	}

	inline void print_error_string(errno_t the_errno) {
		char buffer[255];
		strerror_s(buffer, 255, errno);
		printf("%s\n", buffer);
	}
};

#endif /* MATRIXREADER_H_ */
