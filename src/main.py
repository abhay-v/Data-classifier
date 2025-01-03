import math
import warnings
import matplotlib.pyplot as plt
import random as rand
import numpy as np

def nudft(samples: list, sample_times: list, freq_range: int):
    ats = list(np.linspace(sample_times[0], sample_times[-1], len(sample_times)))

    w = np.array(
        [
            [np.exp(1j * 2 * np.pi * j * i) for i in sample_times]
            for j in range(freq_range)
        ]
    )
    
    f = [np.abs(np.dot(i, samples)) for i in w]
    plt.scatter(range(freq_range), f)
    plt.show()



def test(sample_times: list, frequencies: list):
    samples = np.array(len(sample_times) * [0.0])
    for i in frequencies:
        samples += np.cos(2 * np.pi * float(i) * np.array(sample_times))

    nudft(samples, sample_times, 10)


def main():
    frequencies = [1, 3, 5, 7]
    #sample_times = [0, 0.6, 1.5, 2.6, 4.8, 6.3, 6.9, 8.7, 9.3, 11.5]
    sample_times = [0]
    for i in range(2000 - 1):
        sample_times.append(sample_times[-1] + (rand.random() * 5))

    #sample_times = np.linspace(0, 100, 1000)

    test(sample_times, frequencies)


if __name__ == "__main__":
    warnings.filterwarnings("ignore")
    main()
