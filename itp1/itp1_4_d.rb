n = gets.to_i
array=gets.chomp.split(" ").map(&:to_i)

puts "#{array.min} #{array.max} #{array.inject(:+)}"