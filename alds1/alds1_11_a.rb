N = gets.to_i
N.times do
    row = Array.new(N, 0)
    line = gets.chomp.split(" ").map(&:to_i)
    k = line[1]
    if k > 0
        line[2..(k+1)].each do |i|
            row[i-1] = 1
        end
    end
    puts row.join(" ")
end
