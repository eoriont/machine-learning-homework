import timeit

def big_sum():
    return sum(i for i in range(1000001))

trials = 10
print("[Python] Avg Time (s):", timeit.Timer(big_sum).timeit(number=trials)/trials)
