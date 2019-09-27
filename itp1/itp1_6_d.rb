n,m=gets.chomp.split(" ").map(&:to_i)
A = []
n.times do
    row=gets.chomp.split(" ").map(&:to_i)
    A.push(row)
end
(0..(m-1)).each do |j|
    a = gets.to_i
    (0..(n-1)).each do |i|
        A[i][j] = A[i][j] * a
    end
end

A.each do |row|
    puts row.inject(:+)
end
