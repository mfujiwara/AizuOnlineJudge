while got = gets do
    array=got.chomp.split(",").map(&:to_i)
    l_array = array.shift(10)
    r = l_array.inject(:+).to_f * array[0] / (array[0] + array[1])
    ret = 0
    (0..9).each do |i|
        r -= l_array[i]
        if r <= 0
            puts i+1
            break
        end
    end
end
