while true do
    h,w=gets.chomp.split(" ").map(&:to_i)
    break if h == 0 && w == 0
    (1..h).each do |i|
        line = "#." * ((w+2)/2)
        if i.odd?
            puts line.slice(0, w)
        else
            puts line.slice(1, w)
        end
    end
    puts
end