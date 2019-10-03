n = gets.to_i
array=gets.chomp.split(" ").map(&:to_i)
(1..n).each do |i|
    shifted = array.shift(i)
    array = shifted.sort + array
    puts array.join(" ")
end
