W = gets.chomp.downcase
ret = 0
while true do
    s = gets.chomp
    break if s == "END_OF_TEXT"
    ret += s.downcase.split(" ").select {|e| e==W}.length
end
puts ret