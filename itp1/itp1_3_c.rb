while true do
    array = gets.chomp.split(" ").map(&:to_i)
    break if array[0] == 0 && array[1] == 0

    puts array.sort.join(" ")
end
