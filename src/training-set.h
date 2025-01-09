#ifndef TRAINING_SET_H
#define TRAINING_SET_H

#include <complex.h>
#include <stdint.h>

uint64_t gen_training_set(float *t, float *y, uint64_t size,
                          uint64_t num_points, uint64_t num_samples,
                          float out[][2 * ((num_samples - 1) / 2)]);

#endif // TRAINING_SET_H
