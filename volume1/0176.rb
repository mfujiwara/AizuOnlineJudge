loop do
    s = gets.chomp
    break if s == "0"
    r = s[1..2].hex
    g = s[3..4].hex
    b = s[5..6].hex
    if r < 128 && g < 128 && b < 128
        puts "black"
    elsif r < 128 && g < 128 && b >= 128
        puts "blue"
    elsif r < 128 && g >= 128 && b < 128
        puts "lime"
    elsif r < 128 && g >= 128 && b >= 128
        puts "aqua"
    elsif r >= 128 && g < 128 && b < 128
        puts "red"
    elsif r >= 128 && g < 128 && b >= 128
        puts "fuchsia"
    elsif r >= 128 && g >= 128 && b < 128
        puts "yellow"
    else
        puts "white"
    end
end