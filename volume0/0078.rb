while true do
    n = gets.to_i
    break if n == 0

    answer = a = Array.new(n) { Array.new(n,0) }

    row = (n-1)/2+1
    col = (n-1)/2
    value = 1
    answer[row][col] = value
    value += 1

    size = n*n
    while value <= size do
        row = (row+1) % n
        col = (col+1) % n
        if answer[row][col] == 0
            answer[row][col] = value
            value += 1
        else
            row = (row+1) % n
            col = (col-1) % n
            answer[row][col] = value
            value += 1
        end
    end

    answer.each do |r|
        r.each do |e|
            print e.to_s.rjust(4)
        end
        puts
    end
end
