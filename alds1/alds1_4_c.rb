require 'set'
dic = Set.new
gets.to_i.times do
    task,str=gets.chomp.split(" ")
    if task == "insert"
        dic.add(str)
    else
        if dic.include?(str)
            puts "yes"
        else
            puts "no"
        end
    end
end