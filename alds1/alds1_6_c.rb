def partition(array, p, r)
    x = array[r][1]
    i = p-1
    (p..(r-1)).each do |j|
        if array[j][1] <= x
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

def quicksort(array, p, r)
    if p < r
        q = partition(array, p, r)
        quicksort(array, p, q-1)
        quicksort(array, q+1, r)
    end
    array
end

n = gets.to_i
array1 = []
array2 = []
n.times do
    line = gets.chomp.split(" ")
    e = [line[0], line[1].to_i]
    array1.push(e)
    array2.push(e)
end
sorted1 = quicksort(array1, 0, n-1)
sorted2 = array2.sort_by {|e| e[1] }
puts sorted1==sorted2 ? "Stable" : "Not stable"
sorted1.each do |e|
    puts "#{e[0]} #{e[1]}"
end