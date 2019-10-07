S = gets.chomp
slopes = [0]
(0..(S.length-1)).each do |i|
    if S[i] == "/"
        slopes.push(slopes[-1]+1)
    elsif S[i] == "_"
        slopes.push(slopes[-1])
    else
        slopes.push(slopes[-1]-1)
    end
end

before_max = slopes[0]
left_s = ""
(0..S.length).each do |i|
    if slopes[i] >= before_max
        before_max = slopes[i]
        left_s = "0" + left_s
    else
        left_s = "1" + left_s
    end
end

before_max = slopes[-1]
right_s = ""
(0..S.length).to_a.reverse.each do |i|
    if slopes[i] >= before_max
        before_max = slopes[i]
        right_s = right_s + "0"
    else
        right_s = right_s + "1"
    end
end

s = (left_s.to_i(2) & right_s.to_i(2)).to_s(2).reverse + "0"

cnt = 0
surface = 0
area = 0
areas = []
(0..(s.length-1)).each do |i|
    if s[i] == "0"
        if area != 0
            areas.push(area)
            area = 0
        end
    else
        if area == 0
            cnt += 1
            surface = slopes[i-1]
            area = 1
        else
            area += (surface-slopes[i])
        end
    end
end

if areas.empty?
    puts 0
    puts 0
    exit
end

puts areas.inject(:+)
print "#{cnt} "
puts areas.join(" ")