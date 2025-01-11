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

from extension import *
import extension


def main():
    global ext
    init_extension()
    frequencies = [1, 2, 3, 4, 5, 6, 7, 8]
    # sample_times = [0, 0.6, 1.5, 2.6, 4.8, 6.3, 6.9, 8.7, 9.3, 11.5]
    # sample_times = [0]
    # for i in range(2000 - 1):
    #    sample_times.append(sample_times[-1] + (rand.random() * 5))

    sample_times = np.linspace(0, 10, 2000)

    # test(sample_times, frequencies)

    f = open("data_sock_5-fix", "rb")
    data = np.fromfile(f, dtype=s_data)
    data = ct.cast(
        data.ctypes.data_as(ct.POINTER(s_data)), ct.POINTER((data.size * s_data))
    )[0]

    time = np.array([(i.time / 1000.0) for i in data], dtype=np.float32)
    mag = np.array(
        [np.sqrt(i.x * i.x + i.y * i.y + i.z * i.z) for i in data], dtype=np.float32
    )

    plt.plot(time[:150], mag[:150])
    plt.show()

    res = np.zeros(150, dtype=np.complex64)
    print(type(res))
    extension.ext.nudft(time, mag, 150, res)

    res = np.array(
        [
            np.sqrt(i.real * i.real + i.imag * i.imag)
            for i in res[: int(np.floor((res.size - 1) / 2))]
        ]
    )

    plt.plot(range(len(res)), res)
    plt.show()

    num_samples = 150
    num_points = 50000

    tmp = []
    for i in range(num_points):
        if np.size(time) - i >= num_samples:
            tmp.append(0)

    train = np.zeros(
        (len(tmp), np.int64((num_samples - 1) / 2)), dtype=np.float32, order="C"
    )
    test = np.zeros((10, np.int64((num_samples - 1) / 2)), dtype=np.float32, order="C")

    ind = extension.ext.gen_training_set(
        time, mag, np.size(time), len(tmp), num_samples, train
    )

    tmp = []
    for i in range(10):
        if np.size(time) - i >= num_samples:
            tmp.append(0)

    test_time = np.array(list(time[ind:]), dtype=np.float32)
    test_mag = np.array(list(mag[ind:]), dtype=np.float32)

    extension.ext.gen_training_set(
        test_time,
        test_mag,
        np.size(test_time),
        len(tmp),
        num_samples,
        test,
    )

    print(test)

    svm = OneClassSVM(kernel="rbf", gamma="scale", nu=0.1)
    svm.fit(train)
    joblib.dump(svm, "svm.plk")

    svm = joblib.load("svm.plk")

    print(
        "prediction",
        svm.predict(
            list(test)
            + [train[0]]
            + list(1000 * np.random.rand(10, np.int64((num_samples - 1) / 2)))
        ),
    )


if __name__ == "__main__":
    warnings.filterwarnings("ignore")
    main()
