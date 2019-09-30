while true do
    deck = gets.chomp.split("")
    break if deck == ["-"]
    m = gets.to_i
    m.times do
        h = gets.to_i
        shifted = deck.shift(h)
        deck = deck + shifted
    end
    puts deck.join("")
end