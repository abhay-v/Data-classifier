#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <sys/stat.h>
#include <limits.h>
#include <stdint.h>
#include <inttypes.h>
#include <math.h>
#include <errno.h>

#include "dynamic_array.h"

char *read_file(const char *path, int64_t *size) {
  FILE *f = fopen(path, "rb");
  if (!f) {
    fprintf(stderr, "[ERROR]: Failed to open file %s: ", path);
    perror(NULL);

    return NULL;
  }

  struct stat s;
  fstat(fileno(f), &s);

  *size = s.st_size;
  char *buf = malloc(*size);

  fread(buf, 1, *size, f);

  fclose(f);

  return buf;
}

#define MAX_ITERS 128

static int write_to_file(FILE *file, void *data, int len) {
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

struct __attribute__((packed)) accel {
  uint16_t magic;
  uint64_t time;
  float x, y, z;
};

struct __attribute__((packed)) s_data {
  uint16_t magic;
  uint64_t time;
  float x, y, z;
  float temp;
  float audio;
};

int main(int argc, char **argv) {
  if (argc < 3) {
    fprintf(stderr, "Bad usage: ./reformat [File_path] [out_path]\n");
    return 1;
  }

  int64_t size = 0;

  char *data = read_file(argv[1], &size);
  if (data == NULL) {
    free(data);
    return 1;
  }

  struct s_data *data_view = (struct s_data *)data;
  DA_TYPE(struct s_data) s_data_arr = { 0 };

  while (size > 0) {
    // This if statement is a sanity test that makes sure that we're not reading complete nonsense
    if (data_view->magic == 0xaa55) {
      struct s_data s = {
        .magic = data_view->magic,

        .time = data_view->time,

        .x = data_view->x,
        .y = data_view->y,
        .z = data_view->z,

        .temp = 0.0f,

        .audio = 0.0f,
      };

      DA_APPEND(&s_data_arr, s);

    } else {
      int64_t tmp_size = size;
      struct s_data *tmp_data_view = data_view;
      printf("%ld %p %p\n", tmp_size, data_view, tmp_data_view);
      while (tmp_size) {
        if (tmp_data_view->magic == 0xaa55) {
          data_view = tmp_data_view;
          break;
        }

        tmp_size--;
        tmp_data_view = (struct s_data *)((char *)tmp_data_view + 1);
      }
    }

    data_view += 1;
    size -= sizeof(*data_view);

    if (size && size < sizeof(data_view)) {
      break;
    }
  }

  FILE *o = fopen(argv[2], "wb");
  write_to_file(o, s_data_arr.items,
                s_data_arr.count * sizeof(*s_data_arr.items));

  fclose(o);

  return 0;
}
