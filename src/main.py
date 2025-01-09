import math
import warnings
import matplotlib.pyplot as plt
import random as rand
import numpy as np
import ctypes as ct
from scipy.fftpack import fft
from sklearn.svm import OneClassSVM
import joblib


# struct __attribute__((packed)) accel {
#   uint16_t magic;
#   uint64_t time;
#   float x, y, z;
# };


class s_data(ct.Structure):
    _pack_ = 1
    _fields_ = [
        ("magic", ct.c_uint16),
        ("time", ct.c_uint64),
        ("x", ct.c_float),
        ("y", ct.c_float),
        ("z", ct.c_float),
        ("temp", ct.c_float),
        ("audio", ct.c_float),
    ]

    def __repr__(self):
        return """
        struct s_data {
            magic = %d,
            time = %.3f,

            accel = {
                %.3f,
                %.3f,
                %.3f
            }

            mag = %.3f,

            temp = %.3f,

            audio = %.3f,
        }
        """ % (
            self.magic,
            self.time / 1000.0,
            self.x,
            self.y,
            self.z,
            np.sqrt(self.x * self.x + self.y * self.y + self.z * self.z),
            self.temp,
            self.audio,
        )


ext = None


def init_extension():
    global ext

    ext = np.ctypeslib.load_library("libnudft", "./bin")

    ext.nudft.restype = None
    ext.nudft.argtypes = [
        np.ctypeslib.ndpointer(ct.c_float, ndim=1, flags="C"),
        np.ctypeslib.ndpointer(ct.c_float, ndim=1, flags="C"),
        ct.c_uint64,
        np.ctypeslib.ndpointer(np.complex64, ndim=1, flags="C"),
    ]
    ext.gen_training_set.restype = np.uint64
    ext.gen_training_set.argtypes = [
        np.ctypeslib.ndpointer(ct.c_float, ndim=1, flags="C"),
        np.ctypeslib.ndpointer(ct.c_float, ndim=1, flags="C"),
        ct.c_uint64,
        ct.c_uint64,
        ct.c_uint64,
        np.ctypeslib.ndpointer(ct.c_float, ndim=2, flags="C"),
    ]

def main():
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

    num_samples = 800
    num_points = 4000

    tmp = []
    for i in range(num_points):
        if np.size(time) - i >= num_samples:
            tmp.append(0)

    train = np.zeros((len(tmp), 2 * np.int64((num_samples - 1) / 2)), dtype=np.float32, order="C")
    test = np.zeros((10, 2 * np.int64((num_samples - 1) / 2)), dtype=np.float32, order="C")

    ind = ext.gen_training_set(time, mag, np.size(time), len(tmp), num_samples, train)

    tmp = []
    for i in range(10):
        if np.size(time) - i >= num_samples:
            tmp.append(0)

    test_time = np.array(list(time[ind:]), dtype=np.float32)
    test_mag = np.array(list(mag[ind:]), dtype=np.float32)

    ext.gen_training_set(
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
        svm.predict(list(test) + [train[0]] + list(np.random.rand(10, 2 * np.int64((num_samples - 1) / 2)))),
    )


if __name__ == "__main__":
    warnings.filterwarnings("ignore")
    main()
