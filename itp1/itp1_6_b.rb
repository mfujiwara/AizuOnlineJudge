n = gets.to_i

all_cards = []
["S", "H", "C", "D"].each do |mark|
    (1..13).each do |num|
        all_cards.push("#{mark} #{num}")
    end
end
n.times do
    s = gets.chomp
    all_cards.delete(s)
end

if !all_cards.empty?
    puts all_cards.join("\n")
end
