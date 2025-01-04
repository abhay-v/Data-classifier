#include "nudft.h"

#include <stdio.h>
#include <complex.h>
#include <math.h>
#include <stdlib.h>

#define SIZE 20

int main(void) {
  printf("Hello world\n");
  float x[SIZE];
  float y[SIZE];
  for (uint32_t i = 0; i < SIZE; i++) {
    if (i == 0) {
      x[i] = i;
      continue;
    }

    x[i] = x[i - 1] + (rand() / (float)RAND_MAX) * 4;
    //printf("%f\n", cosf(2.0f * M_PI * 4.0f * x[i]));
    y[i] = cosf(2 * M_PI * 3 * x[i]);
  }
  complex float res[SIZE];
  nudft(x, y, SIZE, res);

  for (int i = 0; i < 5; i++) {
    printf("%f\n", cabsf(res[i]));
  }

  return 0;
}
