while true do
    w,h=gets.chomp.split(" ").map(&:to_i)
    break if w == 0 && h == 0

    tiles = []
    (0..(h-1)).each do |i|
        s = gets.chomp
        if j = s.index("@")
            @init_pos = [i, j]
        end
        tiles.push(s)
    end

    ret = 0
    memo = {}
    (0..(h-1)).each { |i| memo[i] = {} }
    targets = [@init_pos]
    memo[@init_pos[0]][@init_pos[1]] = true
    ret += 1
    while !targets.empty? do
        position = targets.shift
        row = position[0]
        col = position[1]
        
        if row != 0 && memo[row-1][col] == nil && tiles[row-1][col] == "."
            targets.push([row-1, col])
            memo[row-1][col] = true
            ret += 1
        end
        if row != h-1 && memo[row+1][col] == nil && tiles[row+1][col] == "."
            targets.push([row+1, col])
            memo[row+1][col] = true
            ret += 1
        end
        if col != 0 && memo[row][col-1] == nil && tiles[row][col-1] == "."
            targets.push([row, col-1])
            memo[row][col-1] = true
            ret += 1
        end
        if col != w-1 && memo[row][col+1] == nil && tiles[row][col+1] == "."
            targets.push([row, col+1])
            memo[row][col+1] = true
            ret += 1
        end
    end
    puts ret
end