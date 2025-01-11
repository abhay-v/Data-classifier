import math
import warnings
import matplotlib.pyplot as plt
import random as rand
import numpy as np
import ctypes as ct
from scipy.fftpack import fft
from sklearn.svm import OneClassSVM
import joblib
import sys
import os
import atexit

import extension as ext

BUF_SIZE = 1024 * 1024 * 4
NUM_SAMPLES = 800


def main():
    if len(sys.argv) < 2:
        sys.stderr.write("Bad usage: [model_path]\n")
        sys.exit(1)

    ext.init_extension()

    read_fifo = open("/tmp/serv_pipe", "rb")
    write_fifo = open("/tmp/class_pipe", "wb")

    os.set_blocking(read_fifo.fileno(), False)
    os.set_blocking(write_fifo.fileno(), False)

    read_fifo_fp = ext.ext.py_fdopen(read_fifo.fileno(), "rb".encode("utf-8"))
    write_fifo_fp = ext.ext.py_fdopen(write_fifo.fileno(), "wb".encode("utf-8"))

    def cleanup():
        ext.ext.py_fdclose(read_fifo_fp)
        ext.ext.py_fdclose(write_fifo_fp)

    atexit.register(cleanup)

    svm: OneClassSVM = joblib.load(sys.argv[1])

    buf = (ct.sizeof(ext.s_data) * ct.c_uint8)(0)
    buf_count = 0

    samples = (ext.s_data * NUM_SAMPLES)(0)
    sample_count = 0

    while True:
        n = ext.ext.py_fread(
            ct.pointer(buf[buf_count]), 1, ct.sizeof(buf) - buf_count, read_fifo_fp
        )
        buf_count += n

        if buf_count == ct.sizeof(ext.s_data):
            tmp = ct.cast(ct.pointer(buf[0]), ct.POINTER(ext.s_data))
            if tmp[0].magic == 0xAA55:
                ct.memmove(ct.pointer(samples[sample_count]), tmp, ct.sizeof(buf))
                sample_count += 1
                buf_count = 0

            else:
                ct.memmove(ct.pointer(buf[0]), ct.pointer(buf[1]), ct.sizeof(buf) - 1)
                buf_count -= 1

        if sample_count < NUM_SAMPLES:
            continue

        sample_count = 0

        time = np.array([(i.time / 1000.0) for i in samples], dtype=np.float32)
        mag = np.array(
            [np.sqrt(i.x * i.x + i.y * i.y + i.z * i.z) for i in samples],
            dtype=np.float32,
        )

        res = np.zeros(NUM_SAMPLES, dtype=np.complex64)
        ext.ext.nudft(time, mag, NUM_SAMPLES, res)

        res = np.array(
            [
                np.sqrt(i.real * i.real + i.imag * i.imag)
                for i in res[: int(np.floor((res.size - 1) / 2))]
            ]
        )

        prediction = ct.c_int32(svm.predict([res])[0])
        ext.ext.py_write_to_file(
            write_fifo_fp, ct.pointer(prediction), ct.sizeof(prediction)
        )


if __name__ == "__main__":
    main()
