def partition(array, p, r)
    x = array[r]
    i = p-1
    (p..(r-1)).each do |j|
        if array[j] <= x
            i += 1
            tmp = array[i]
            array[i] = array[j]
            array[j] = tmp
        end
    end
    tmp = array[i+1]
    array[i+1] = array[r]
    array[r] = tmp
    i+1
end

n=gets.to_i
array=gets.chomp.split(" ").map(&:to_i)
index = partition(array, 0, n-1)
puts array.map.with_index{|e,i| i==index ? "[#{e}]" : e.to_s }.join(" ")