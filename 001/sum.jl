function bigSum()
    sum(1:1000000)
end

times = []
for i in 1:10
    beginning = time_ns()
    bigSum()
    push!(times, time_ns() - beginning)
end

println("[Julia] Avg Time (s): ", sum(times)/length(times) / 1000000000)
