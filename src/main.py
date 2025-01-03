import math
import warnings
import matplotlib.pyplot as plt
import random as rand
import numpy as np

eps = 1e-6

def c_l(points: list, at: float):
    s = 0
    for i in points:
        print(at, i, np.sin((at - i) / 2))

        s += np.log(np.sin((at - i) / 2) + 0J)
    
    return np.exp(s)


def d_j(points: list, j: int):
    s = 0
    for index, i in enumerate(points):
        if index != j:
            s += np.log(np.sin((points[j] - i) / 2) + 0J)
    
    return np.exp(-s)

def trig_interp(points: list, samples: list, ats: list):
    a = [0 + 0J] * len(samples)
    for i, _ in enumerate(samples):
        samples[i] *= d_j(points, i)

    for l, _ in enumerate(a):
        for j, f_j in enumerate(samples):
            a[l] += f_j / np.tan((points[l] - ats[j]) / 2)

    for l, _ in enumerate(a):
        a[l] -= (0+1J) * sum(samples)

    for l, _ in enumerate(a):
        if points[l] >= ats[l] - eps and points[l] <= ats[l] + eps:
            a[l] = samples[l]
        else:
            a[l] *= c_l(points, ats[l])
    

    return a

def nufft(samples: list, sample_times: list, freq_range: tuple):
    ats = list(np.linspace(sample_times[0], 
                           sample_times[-1], len(sample_times)))
    a = trig_interp(sample_times, samples, ats)
    print(a)


def test(sample_times: list, frequencies: list):
    samples = np.array(len(sample_times) * [0.0])
    
    for i in frequencies:
        samples += np.cos(2 * np.pi * float(i) * np.array(sample_times))

    nufft(samples, sample_times, (3, 6))

    plt.scatter(sample_times, samples)
    plt.show()



def main():
    frequencies = [3, 5, 7]
    sample_times = [0, 0.6, 1.5, 2.6, 4.8, 6.3, 6.9, 8.7, 9.3, 11.5]

    test(sample_times, frequencies)



if __name__ == "__main__":
    warnings.filterwarnings('ignore')
    main()
