n = gets.to_i
a_array=gets.chomp.split(" ").map(&:to_i).sort { |a, b| b <=> a }

ret = -1
(0..n-2).each do |i|
    ((i+1)..(n-1)).each do |j|
        prod = a_array[i] * a_array[j]        
        if ret != -1 && ret > prod
            next
        end
        prods = prod.to_s.split("").map(&:to_i)
        judge = true
        (1..(prods.length - 1)).each do |ind|
            if prods[ind] != prods[ind-1] + 1
                judge = false
                break
            end
        end
        if judge
            ret = prod
        end
    end
end

puts ret
