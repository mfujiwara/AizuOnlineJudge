while true do
    a,o,b=gets.chomp.split(" ")
    break if o == "?"
    a = a.to_i
    b = b.to_i

    ret = case o
    when "+"
        a+b
    when "-"
        a-b
    when "/"
        a/b
    when "*"
        a*b
    end

    puts ret
end