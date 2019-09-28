while true do
    n,x=gets.chomp.split(" ").map(&:to_i)
    break if n == 0 && x == 0
    selected = (1..n).to_a.combination(3).to_a.select do |arr|
        arr.inject(:+) == x
    end
    puts selected.length
end