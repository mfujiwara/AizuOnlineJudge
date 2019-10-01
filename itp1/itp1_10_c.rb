while true do
    n = gets.to_i
    break if n == 0
    array=gets.chomp.split(" ").map(&:to_f)
    average = array.inject(:+)/n
    puts format("%0.5f", (array.map {|e| (e-average)**2}.inject(:+)/n)**0.5)
end