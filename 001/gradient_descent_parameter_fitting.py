import timeit

dataset = [(0, 0), (1, 1), (2, 4)]

# Minimize squared error between dataset and predictions
def f(beta0, beta1):
    return sum((y - (beta0 + beta1*x))**2 for x, y in dataset)

def gradient_descent():
    # Arguments
    alpha = 0.001
    delta = 0.001
    max_iters = 10000

    betas = [0, 2]
    for i in range(max_iters):
        left = f(betas[0]-delta, betas[1])
        right = f(betas[0]+delta, betas[1])
        central_diff_approx1 = (right-left)/(2*delta)

        left = f(betas[0], betas[1]-delta)
        right = f(betas[0], betas[1]+delta)
        central_diff_approx2 = (right-left)/(2*delta)

        old = betas.copy()
        betas[0] -= alpha * central_diff_approx1
        betas[1] -= alpha * central_diff_approx2

        # Stopping criteria
        threshold = 0.00001
        if (abs(betas[0]-old[0]) < threshold and abs(betas[1]-old[1]) < threshold):
            break

    return betas

trials = 10
print("[Python] Avg Time (s):", timeit.Timer(gradient_descent).timeit(number=trials)/trials)
