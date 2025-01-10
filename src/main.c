#include <complex.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "nudft.h"
#include "training-set.h"

#define SIZE 300000
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
  //complex float res[SIZE];
  //nudft(x, y, SIZE, res);

  //printf("\n");
  //for (int i = 0; i < 100; i++) {
  //  printf("%f\n", cabsf(res[i]));
  //}

  //float res[50000][(100 - 1) / 2];
  float *res = malloc(50000 * sizeof(int[(100 - 1) / 2]));
  gen_training_set(x, y, SIZE, 50000, 100, (float(*)[])res);
  gen_training_set(&x[50000], &y[50000], SIZE - 50000, 10, 100,
                   (float(*)[])res);

  free(x);
  free(y);
  return 0;
}
