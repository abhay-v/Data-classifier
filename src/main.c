#include <complex.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "nudft.h"

#define SIZE 2000
#define TIME 5.0f

int main(void) {
  srand(time(NULL));

  printf("Hello world\n");
  float *x = malloc(SIZE * sizeof(*x));
  float *y = calloc(SIZE, sizeof(*y));

  float f[] = { 2.0f, 4.0f, 6.0f };

  float dt = TIME / SIZE;
  for (int j = 0; j < (int)(sizeof(f) / sizeof(f[0])); j++) {
    float phi = (rand() / (float)RAND_MAX) * 10;

    for (int i = 0; i < SIZE; i++) {
      x[i] = i * dt;
      y[i] += cosf(2 * M_PI * f[j] * x[i] + phi);
      // y[i] += expf(-pow(x[i] - 5, 2));
    }
  }
  complex float res[SIZE];
  nudft(x, y, SIZE, res);

  printf("\n");
  for (int i = 0; i < 100; i++) {
    printf("%f\n", cabsf(res[i]));
  }

  free(x);
  free(y);
  return 0;
}
