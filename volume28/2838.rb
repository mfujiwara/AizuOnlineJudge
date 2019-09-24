s = gets.chomp
array = s.split("").map(&:ord)

pre = "A".ord
ret = 0
array.each_with_index do |e|
    if e <= pre
        ret += 1
    end
    pre = e
end
puts ret
