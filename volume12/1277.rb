while true do
    n,t,l,b=gets.chomp.split(" ").map(&:to_i)
    exit if n == 0
    l_array = []
    b_array = []
    l.times do
        l_array.push(n - gets.to_i)
    end
    b.times do
        b_array.push(n - gets.to_i)
    end
    board = Array.new(n+1, 0)
    rest_board = Array.new(n+1, 0)
    board[n] = 1
    t.times do
        next_board = Array.new(n+1, 0)
        next_rest_board = Array.new(n+1, 0)

        board.each_with_index do |num, i|
            if i == 0
                next_board[0] = num * 6
            else
                (1..6).each do |j|
                    next_board[(i-j).abs] += num
                end
            end
        end
        l_array.each do |i|
            next_rest_board[i] = next_board[i]
            next_board[i] = 0
        end
        b_array.each do |i|
            next_board[n] += next_board[i]
            next_board[i] = 0
        end
        rest_board.each_with_index do |num, i|
            next_board[i] += num * 6
        end

        board = next_board
        rest_board = next_rest_board
    end
    sum = board.inject(:+) + rest_board.inject(:+)
    goal = board[0]

    result = (goal.to_f / sum.to_f).round(6)
    puts format("%.6f", result)
end