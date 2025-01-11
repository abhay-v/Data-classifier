#include <string.h>
#include <stdlib.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <unistd.h>
#include <errno.h>

#define MAX_ITERS 128

void *py_memmove(void *dest, void *src, size_t n) {
  return memmove(dest, src, n);
}

void *py_memcpy(void *dest, void *src, size_t n) {
  return memcpy(dest, src, n);
}

void py_free(void *ptr) {
  free(ptr);
}

void *py_element_ptr(void *array, size_t size, uint64_t i) {
  return (char *)array + i * size;
}

FILE *py_fdopen(int fd, const char *modes) {
  return fdopen(fd, modes);
}

int py_fclose(FILE *f) {
  return fclose(f);
}

size_t py_fread(void *restrict ptr, size_t size, size_t n,
                FILE *restrict stream) {
  return fread(ptr, size, n, stream);
}

int py_write_to_file(FILE *file, void *data, int64_t len) {
  errno = 0;
  uint32_t iter = 0;
  do {
    int n = fwrite(data, 1, len, file);

    len -= n;
    data = (char *)data + n;

    iter++;

  } while (iter < MAX_ITERS && len);

  if (len != 0) {
    perror("Failed to complete write");
    return 1;
  }

  fflush(file);

  return 0;
}
