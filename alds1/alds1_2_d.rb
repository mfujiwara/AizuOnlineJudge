N = gets.to_i
array = []
N.times do
    array.push(gets.to_i)
end

def insertionSort(array, n, g)
    (g..(n-1)).each do |i|
        v = array[i]
        j = i - g
        while j >= 0 && array[j] > v do
            array[j+g] = array[j]
            j = j - g
            @cnt += 1
        end
        array[j+g] = v
    end
end
def shellSort(array, n, m, g_array)
    @cnt = 0
    (0..(m-1)).each do |i|
        insertionSort(array, n , g_array[i])
    end
end

m = 1
g_array = [N/2]
while g_array[-1] > 1 do
    m+=1
    g_array.push(g_array[-1]/2)
end
shellSort(array, N, m, g_array)

puts m
puts g_array.join(" ")
puts @cnt
puts array
