require 'set'
N = gets.to_i
A=gets.chomp.split(" ").map(&:to_i)
gets
M=gets.chomp.split(" ").map(&:to_i)

memo = Set.new
(1..N).each do |n|
    A.combination(n) do |combi|
        memo.add(combi.inject(:+))
    end
end

ret = M.map {|e| memo.include?(e) ? "yes" : "no" }
puts ret