@memo = {0 => 1, 1 => 1}
def fib(n)
    return @memo[n] if @memo[n]
    v = fib(n-1) + fib(n-2)
    @memo[n] = v
    return v
end

puts fib(gets.to_i)
