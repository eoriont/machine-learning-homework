import timeit

def f(x, y):
    return 1 + 2*x**2 + 3*y**2

def gradient_descent():
    # Arguments
    alpha = 0.0001
    delta = 0.0001
    max_iters = 10000000

    start = [1, 2]
    for i in range(max_iters):
        left = f(start[0]-delta, start[1])
        right = f(start[0]+delta, start[1])
        central_diff_approx1 = (right-left)/(2*delta)

        left = f(start[0], start[1]-delta)
        right = f(start[0], start[1]+delta)
        central_diff_approx2 = (right-left)/(2*delta)

        old = start.copy()
        start[0] -= alpha * central_diff_approx1
        start[1] -= alpha * central_diff_approx2

        # Stopping criteria
        threshold = 0.00001
        if (abs(start[0]-old[0]) < threshold and abs(start[1]-old[1]) < threshold):
            break

    return start

trials = 10
print("[Python] Avg Time (s):", timeit.Timer(gradient_descent).timeit(number=trials)/trials)
