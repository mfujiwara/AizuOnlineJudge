def merge_count(left, right)
    return 0 if left+1 >= right
    
    mid = (left + right)/2
    return right - left + merge_count(left, mid) + merge_count(mid, right)
end

N=gets.to_i
puts gets.chomp.split(" ").map(&:to_i).sort.join(" ")
puts merge_count(0, N)