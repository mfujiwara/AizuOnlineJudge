dice=gets.chomp.split(" ").map(&:to_i)
gets.to_i.times do
    top,front=gets.chomp.split(" ").map(&:to_i)
    if top==dice[1]&&front==dice[2] ||
        top==dice[2]&&front==dice[4] ||
        top==dice[4]&&front==dice[3] ||
        top==dice[3]&&front==dice[1]
        puts dice[0]
    elsif top==dice[0]&&front==dice[3] ||
        top==dice[3]&&front==dice[5] ||
        top==dice[5]&&front==dice[2] ||
        top==dice[2]&&front==dice[0]
        puts dice[1]
    elsif top==dice[0]&&front==dice[1] ||
        top==dice[1]&&front==dice[5] ||
        top==dice[5]&&front==dice[4] ||
        top==dice[4]&&front==dice[0]
        puts dice[2]
    elsif top==dice[0]&&front==dice[4] ||
        top==dice[4]&&front==dice[5] ||
        top==dice[5]&&front==dice[1] ||
        top==dice[1]&&front==dice[0]
        puts dice[3]
    elsif top==dice[0]&&front==dice[2] ||
        top==dice[2]&&front==dice[5] ||
        top==dice[5]&&front==dice[3] ||
        top==dice[3]&&front==dice[0]
        puts dice[4]
    else
        puts dice[5]
    end
end