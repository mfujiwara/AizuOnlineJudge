N = gets.to_i
array_x=gets.chomp.split(" ").map(&:to_i)
array_y=gets.chomp.split(" ").map(&:to_i)

def distance(x, y, p)
    (0..(N-1)).to_a.map {|n| (x[n]-y[n]).abs**p }.inject(:+)**(1.0/p)
end

puts format("%0.5f", distance(array_x,array_y,1))
puts format("%0.5f", distance(array_x,array_y,2))
puts format("%0.5f", distance(array_x,array_y,3))
puts format("%0.5f", (0..(N-1)).to_a.map {|n| (array_x[n]-array_y[n]).abs }.max)