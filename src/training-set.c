#include <complex.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#include "nudft.h"
#include "training-set.h"

uint64_t gen_training_set(float *t, float *y, uint64_t size,
                          uint64_t num_points, uint64_t num_samples,
                          float out[][(num_samples - 1) / 2]) {
  printf("%lu, %lu\n", (num_samples - 1) / 2,
         sizeof(out[0]) / sizeof((out[0][0])));
  uint64_t i = 0;
  for (i = 0; i < num_points; i++) {
    if (size - i < num_samples) {
      break;
    }

    printf("\33[2K\r");
    printf("%lu", i);
    fflush(stdout);

    complex float *tmp = malloc(num_samples * sizeof(*tmp));
    nudft(&t[i], &y[i], num_samples, tmp);

    for (uint64_t j = 0; j < (num_samples - 1) / 2; j++) {
      float real = crealf(tmp[j]);
      float imag = cimagf(tmp[j]);
      out[i][j] = sqrtf(real * real + imag * imag);
      //out[i][j + 1] = cimagf(tmp[j / 2]);
    }

    free(tmp);
  }

  printf("\n");
  return i;
}
