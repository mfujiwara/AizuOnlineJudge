N = gets.to_i
array=gets.chomp.split(" ").map(&:to_i)

ctn = 0
(0..(N-1)).each do |i|
    mini = i
    (i..N-1).each do |j|
        mini = j if array[j] < array[mini]
    end
    if i != mini
        tmp = array[i]
        array[i] = array[mini]
        array[mini] = tmp
        ctn += 1
    end
end

puts array.join(" ")
puts ctn