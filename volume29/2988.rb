N = gets.to_i
a_array=gets.chomp.split(" ").map(&:to_i)

even_count = a_array.select{|e| e.even? }.length
odd_count = N - even_count

if even_count == 0 || odd_count == 0
    puts 0
elsif odd_count.odd?
    puts N-1
else
    puts N-2
end
