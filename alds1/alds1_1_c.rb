require 'prime'
N = gets.to_i
ret = 0
N.times do
    ret += 1 if Prime.prime?(gets.to_i)
end
puts ret