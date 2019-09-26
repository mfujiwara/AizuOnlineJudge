while true do
    h,w=gets.chomp.split(" ").map(&:to_i)
    break if h == 0 && w == 0
    (1..h).each do |i|
        if i == 1 || i == h
            puts "#" * w
        else
            puts "#" + "." * (w-2) + "#"
        end
    end
    puts
end