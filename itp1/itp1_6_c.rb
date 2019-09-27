buildings = []
4.times do
    building = []
    3.times do
        floor = []
        10.times do
            floor.push(0)
        end
        building.push(floor)
    end
    buildings.push(building)
end

n = gets.to_i
n.times do
    b,f,r,v=gets.chomp.split(" ").map(&:to_i)
    buildings[b-1][f-1][r-1] += v
end

buildings.each_with_index do |building, i|
    puts "####################" if i != 0
    building.each do |floor|
        puts " " + floor.join(" ")
    end
end
