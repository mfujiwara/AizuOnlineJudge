x1,y1,x2,y2=gets.chomp.split(" ").map(&:to_f)
puts format("%0.5f", (((x1-x2).abs**2 + (y1-y2).abs**2).to_f)**(0.5))