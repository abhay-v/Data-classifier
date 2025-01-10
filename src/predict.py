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

import extension as ext


def main():
    print(len(sys.argv))

    if len(sys.argv) < 2:
        sys.stderr.write("Bad usage: [model_path]\n")
        sys.exit(1)

    ext.init_extension()

    read_fifo = open("/tmp/serv_pipe", "rb")
    write_fifo = open("/tmp/class_pipe", "wb")

    svm = joblib.load(sys.argv[1])




if __name__ == "__main__":
    main()
