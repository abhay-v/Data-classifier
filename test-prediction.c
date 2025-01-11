#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <errno.h>
#include <unistd.h>
#include <limits.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <fcntl.h>

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

struct __attribute__((packed)) s_data {
  uint16_t magic;
  uint64_t time;
  float x, y, z;
  float temp;
  float audio;
};

int main(void) {
  mkfifo("/tmp/serv_pipe",
         S_IRWXU | S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH | S_IWOTH);
  mkfifo("/tmp/class_pipe",
         S_IRWXU | S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH | S_IWOTH);

  FILE *send_fifo = fopen("/tmp/serv_pipe", "wb");
  FILE *recv_fifo = fopen("/tmp/class_pipe", "rb");

  fcntl(fileno(send_fifo), F_SETFL,
        fcntl(fileno(send_fifo), F_GETFL, 0) | O_NONBLOCK);
  fcntl(fileno(recv_fifo), F_SETFL,
        fcntl(fileno(recv_fifo), F_GETFL, 0) | O_NONBLOCK);

  int64_t size = 0;

  char *data = read_file("./data_sock_5-fix", &size);
  if (data == NULL) {
    return 1;
  }

  struct s_data *data_view = (struct s_data *)data;

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

      write_to_file(send_fifo, &s, sizeof(s));
    }

    data_view += 1;
    size -= sizeof(*data_view);

    usleep(20 * 1000);

    if (size && size < sizeof(data_view)) {
      break;
    }
  }

  return 0;
}
