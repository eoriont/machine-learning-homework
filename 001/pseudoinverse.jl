function linearRegression()
    X = [1 0; 1 1; 1 2; 1 3]
    y = reshape([0; 1; 4; 9], :, 1)
    inv(transpose(X)*X)*(transpose(X)*y)
end

times = UInt64[]
for i in 1:10
    beginning = time_ns()
    linearRegression()
    push!(times, time_ns() - beginning)
end

println("[Julia] Avg Time (s): ", sum(times)/length(times) / 1000000000)
