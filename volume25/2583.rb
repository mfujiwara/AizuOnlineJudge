tree = []
while true do
    n = gets.to_i
    break if n == 0
    n.times do
        tree.push(gets.chomp)
    end
    afters = []
    tree.reverse.each do |e|
        dot_count = e.count(".")
        next if dot_count == 0
        afters = afters.select{|after| after < dot_count }
        afters.push(dot_count)
        afters.each do |after|
            e[after-1] = "|"
        end
        e[dot_count-1] = "+"
        e.gsub!(/\./, " ")
    end
    puts tree
    tree = []
end