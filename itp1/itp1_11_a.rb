dice=gets.chomp.split(" ").map(&:to_i)
gets.chomp.split("").each do |command|
    if command == "N"
        tmp = dice[0]
        dice[0] = dice[1]
        dice[1] = dice[5]
        dice[5] = dice[4]
        dice[4] = tmp
    elsif command == "E"
        tmp = dice[0]
        dice[0] = dice[3]
        dice[3] = dice[5]
        dice[5] = dice[2]
        dice[2] = tmp
    elsif command == "W"
        tmp = dice[0]
        dice[0] = dice[2]
        dice[2] = dice[5]
        dice[5] = dice[3]
        dice[3] = tmp
    else
        tmp = dice[0]
        dice[0] = dice[4]
        dice[4] = dice[5]
        dice[5] = dice[1]
        dice[1] = tmp
    end
end
puts dice[0]