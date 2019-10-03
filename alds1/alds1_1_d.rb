min = nil
ret = nil
gets.to_i.times do
    r = gets.to_i
    ret = r - min if min != nil && (ret == nil || ret < r - min)
    min = r if min == nil || min > r
end
puts ret
