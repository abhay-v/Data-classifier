#include "nudft.h"

#include <stdio.h>
#include <complex.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>

#define SIZE 1000
#define TIME 5.0f

int main(void) {
  srand(time(NULL));

  printf("Hello world\n");
  float x[SIZE];
  float y[SIZE] = { 0 };

  float f[] = { 2.0f, 4.0f, 6.0f };

  float dt = TIME / SIZE;
  for (int j = 0; j < (int)(sizeof(f) / sizeof(f[0])); j++) {
    float phi = (rand() / (float)RAND_MAX) * 10;

    for (int i = 0; i < SIZE; i++) {
      x[i] = i * dt;
      y[i] += cosf(2 * M_PI * f[j] * x[i] + phi);
      //y[i] += expf(-pow(x[i] - 5, 2));
    }
  }
  complex float res[SIZE];
  nudft(x, y, SIZE, res);

  printf("\n");
  for (int i = 0; i < 100; i++) {
    printf("%f\n", cabsf(res[i]));
  }

  return 0;
}
