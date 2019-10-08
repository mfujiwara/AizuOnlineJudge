gets.to_i
array1=gets.chomp.split(" ").map(&:to_i)
gets.to_i
array2=gets.chomp.split(" ").map(&:to_i)

array = array1.uniq + array2.uniq
puts array.group_by {|e| e }.select{|k,v| v.length == 2 }.length