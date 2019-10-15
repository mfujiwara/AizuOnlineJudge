n = gets.to_i
array=gets.chomp.split(" ").map(&:to_i)
sorted = array.sort

ret = 0

(0..(n-1)).each do |i|
    t = sorted[i]
    t_index = array.index(t)
    count = 0
    while t_index > i do
        count+=1
        s = sorted[t_index]
        s_index = array.index(s)
        ret+=s
        array[t_index], array[s_index] = array[s_index], array[t_index]
        t_index = s_index
    end
    ret += [t*count, t*2+sorted[0]*(count+2)].min
end

puts ret