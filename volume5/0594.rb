W,H,N=gets.chomp.split(" ").map(&:to_i)

count = 0
now_pos = gets.chomp.split(" ").map(&:to_i)
(N-1).times do
    next_pos = gets.chomp.split(" ").map(&:to_i)
    x_diff = now_pos[0] - next_pos[0]
    y_diff = now_pos[1] - next_pos[1]
    x_diff_abs = x_diff.abs
    y_diff_abs = y_diff.abs
    count = count + x_diff_abs + y_diff_abs
    if x_diff * y_diff > 0
        count = count - (x_diff_abs < y_diff_abs ? x_diff_abs : y_diff_abs)
    end
    now_pos = next_pos
end
puts count
