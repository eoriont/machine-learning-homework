function f(x, y)
    1 + 2*x^2 + 3*y^2
end

function gradientDescent()
    # Arguments
    alpha = 0.0001
    delta = 0.0001
    max_iters = 10000000

    start = [1.0, 2.0]
    for i in 1:max_iters
        left = f(start[1]-delta, start[2])
        right = f(start[1]+delta, start[2])
        centralDiffApprox1 = (right-left)/(2*delta)

        left = f(start[1], start[2]-delta)
        right = f(start[1], start[2]+delta)
        centralDiffApprox2 = (right-left)/(2*delta)

        old = copy(start)
        start[1] -= alpha * centralDiffApprox1
        start[2] -= alpha * centralDiffApprox2

        # Stopping criteria
        threshold = 0.00001
        if abs(start[2]-old[2]) < threshold && abs(start[1]-old[1]) < threshold
            break
        end
    end

    start
end


times = UInt64[]
for i in 1:10
    beginning = time_ns()
    gradientDescent()
    push!(times, time_ns() - beginning)
end

println("[Julia] Avg Time (s): ", sum(times)/length(times) / 1000000000)

