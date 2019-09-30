str = gets.chomp
q = gets.to_i
q.times do
    command = gets.chomp.split(" ")
    if command[0] == "print"
        puts str[command[1].to_i..command[2].to_i]
    elsif command[0] == "reverse"
        a = command[1].to_i
        b = command[2].to_i
        prefix = a==0 ? "" : str[0..(a-1)]
        surfix = b==str.length-1 ? "" : str[(b+1)..(str.length-1)]
        str = prefix + str[a..b].reverse + surfix
    elsif command[0] == "replace"
        a = command[1].to_i
        b = command[2].to_i
        prefix = a==0 ? "" : str[0..(a-1)]
        surfix = b==str.length-1 ? "" : str[(b+1)..(str.length-1)]
        str = prefix + command[3] + surfix
    end
end
