n = gets.to_i
ret = [0, 0]
n.times do
    a,b = gets.chomp.split(" ")
    if a > b
        ret[0] += 3
    elsif a < b
        ret[1] += 3
    else
        ret[0] += 1
        ret[1] += 1
    end
end
puts ret.join(" ")