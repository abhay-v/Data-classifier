import math
import warnings
import matplotlib.pyplot as plt
import random as rand
import numpy as np
import ctypes as ct


# struct __attribute__((packed)) accel {
#   uint16_t magic;
#   uint64_t time;
#   float x, y, z;
# };

class Accel(ct.Structure):
    _pack_ = 1
    _fields_ = [
        ("magic", ct.c_uint16),
        ("time", ct.c_uint64),
        ("x", ct.c_float),
        ("y", ct.c_float),
        ("z", ct.c_float),
    ]



ext = None
def init_extension():
    global ext

    ext = np.ctypeslib.load_library("libnudft", "./bin")

    ext.nudft.restype = None
    ext.nudft.argtypes = [
        np.ctypeslib.ndpointer(ct.c_float, ndim=1, flags='C'),
        np.ctypeslib.ndpointer(ct.c_float, ndim=1, flags='C'),
        ct.c_uint64,
        np.ctypeslib.ndpointer(np.complex64, ndim=1, flags="C"),
    ]


def nudft(samples: list, sample_times: list, freq_range: int):
    ats = list(np.linspace(sample_times[0], sample_times[-1], len(sample_times)))

    w = np.array(
        [
            [np.exp(1j * 2 * np.pi * j * i) for i in sample_times]
            for j in range(len(sample_times))
        ]
    )

    mat = np.matrix(w)
    mat **= -1

    f = [np.dot(i, samples) for i in w]

    g = np.abs(f)

    plt.plot(
        range(int(np.floor(len(sample_times) / 2))),
        g[: int(np.floor(len(sample_times) / 2))],
    )
    plt.show()

    f = mat * np.matrix(f).transpose()

    plt.plot(
        list(sample_times)[: int(np.floor(len(sample_times) / 2))],
        f[: int(np.floor(len(sample_times) / 2))],
    )
    plt.show()


def test(sample_times: list, frequencies: list):
    samples = np.array(len(sample_times) * [0.0], dtype=np.float32)
    for i in frequencies:
        samples += np.cos(
            2 * np.pi * float(i) * np.array(sample_times)
            + (5 * rand.random() + np.pi / 2)
        )

    sample_times = np.array(sample_times, dtype=np.float32)
    #samples = np.exp(-np.power(sample_times - 5, 2))
    # samples = np.sign(sample_times)
    nudft(samples, sample_times, 10)
    
    res = np.array(np.zeros(sample_times.size), dtype=np.complex64)
    ext.nudft(sample_times, samples, sample_times.size, res)

    g = np.abs(res)
    plt.plot(
        range(int(np.floor(len(sample_times) / 2))),
        g[: int(np.floor(len(sample_times) / 2))],
    )
    plt.show()

    plt.plot(sample_times, samples)
    plt.show()


def main():
    init_extension()
    print(ct.sizeof(Accel))
    frequencies = [1, 2, 3, 4, 5, 6, 7, 8]
    # sample_times = [0, 0.6, 1.5, 2.6, 4.8, 6.3, 6.9, 8.7, 9.3, 11.5]
    # sample_times = [0]
    # for i in range(2000 - 1):
    #    sample_times.append(sample_times[-1] + (rand.random() * 5))

    sample_times = np.linspace(0, 10, 2000)

    test(sample_times, frequencies)


if __name__ == "__main__":
    warnings.filterwarnings("ignore")
    main()
