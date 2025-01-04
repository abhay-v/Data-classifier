#pragma once

#ifndef NUDFT_H
#define NUDFT_H

#include <stdint.h>
#include <complex.h>

// Memory freed by caller
void nudft(float *x, float *y, uint64_t num_samples, complex float *res);

// Expose the free function
void nudft_free(void *p);

#endif // NUDFT_H
