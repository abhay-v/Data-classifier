#include "nudft.h"

#include <stdint.h>
#include <gsl/gsl_complex.h>
#include <complex.h>
#include <stdlib.h>
#include <cglm/include/cglm/cglm.h>
#include <gsl/gsl_matrix.h>
#include <gsl/gsl_vector.h>
#include <gsl/gsl_blas.h>
#include <string.h>

void nudft(float *x, float *y, uint64_t num_samples, complex float *res) {
  gsl_matrix_complex_float *m =
    gsl_matrix_complex_float_alloc(num_samples, num_samples);

  for (uint64_t i = 0; i < num_samples; i++) {
    for (uint64_t j = 0; j < num_samples; j++) {
      complex float w_ij = cexpf(1.0fJ * 2.0f * M_PI * i * x[j]);
      gsl_matrix_complex_float_set(m, i, j, w_ij);
    }
  }

  gsl_vector_complex_float *y_vec = gsl_vector_complex_float_alloc(num_samples);
  for (uint64_t i = 0; i < num_samples; i++) {
    gsl_vector_complex_float_set(y_vec, i, y[i] + 0.0fJ);
    //printf("%f + %fi\n", creal(gsl_vector_complex_float_get(y_vec, i)),
    //       cimag(gsl_vector_complex_float_get(y_vec, i)));
  }

  gsl_vector_complex_float *res_vec =
    gsl_vector_complex_float_alloc(num_samples);

  gsl_blas_cgemv(CblasNoTrans, 1.0f + 0.0fJ, m, y_vec, 0.0f + 0.0fJ, res_vec);

  for (int i = 0; i < num_samples; i++) {
    //printf("%f + %fi\n", creal(gsl_vector_complex_float_get(res_vec, i)),
    //       cimag(gsl_vector_complex_float_get(res_vec, i)));
  }

  memcpy(res, res_vec->data, res_vec->size * sizeof(*res));

  gsl_matrix_complex_float_free(m);
  gsl_vector_complex_float_free(y_vec);
  gsl_vector_complex_float_free(res_vec);
}

void nudft_free(void *p) {
  free(p);
}
