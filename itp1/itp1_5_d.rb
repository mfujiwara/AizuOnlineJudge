n = gets.to_i
puts " " + (1..n).to_a.select {|e| e%3==0 || e.to_s.include?("3") }.join(" ")