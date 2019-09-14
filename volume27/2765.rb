l = gets.to_i
n = gets.to_i
puts n
n.times do
    x,w=gets.chomp.split(" ").map(&:to_i)
    puts "#{-x} #{w}"
end
