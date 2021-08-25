dataset = [(0.0, 0.0), (1.0, 1.0), (2.0, 4.0)]
function f(beta0, beta1)
    sum((y - (beta0 + beta1*x))^2 for (x, y) in dataset)
end

function gradientDescent()
    # Arguments
    alpha = 0.001
    delta = 0.001
    max_iters = 10000

    betas = [0.0, 2.0]
    for i in 1:max_iters
        left = f(betas[1]-delta, betas[2])
        right = f(betas[1]+delta, betas[2])
        centralDiffApprox1 = (right-left)/(2*delta)

        left = f(betas[1], betas[2]-delta)
        right = f(betas[1], betas[2]+delta)
        centralDiffApprox2 = (right-left)/(2*delta)

        old = copy(betas)
        betas[1] -= alpha * centralDiffApprox1
        betas[2] -= alpha * centralDiffApprox2

        # Stopping criteria
        threshold = 0.00001
        if abs(betas[2]-old[2]) < threshold && abs(betas[1]-old[1]) < threshold
            break
        end
    end

    betas
end

times = UInt64[]
for i in 1:10
    beginning = time_ns()
    gradientDescent()
    push!(times, time_ns() - beginning)
end

println("[Julia] Avg Time (s): ", sum(times)/length(times) / 1000000000)
