import numpy as np
import timeit

def linear_regression():
    X = np.array([[1, 0], [1, 1], [1, 2], [1, 3]])
    y = np.array([[0], [1], [4], [9]])
    return np.linalg.inv(X.transpose()@X) @ (X.transpose()@y)

trials = 10
print("[Python] Avg Time (s):", timeit.Timer(linear_regression).timeit(number=trials)/trials)
