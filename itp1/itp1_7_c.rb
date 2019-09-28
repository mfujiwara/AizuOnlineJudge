R,C=gets.chomp.split(" ").map(&:to_i)
last_low = Array.new(C+1, 0)
rows = []
R.times do
    arr=gets.chomp.split(" ").map(&:to_i)
    arr.push(arr.inject(:+))
    puts arr.join(" ")
    last_low = [last_low, arr].transpose.map{|a| a.inject(:+) }
end

puts last_low.join(" ")
