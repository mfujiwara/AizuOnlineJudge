curves = [[0.0,0.0], [100.0,0.0]]
gets.to_i.times do
    next_curves = []
    curves.map.with_index do |point, index|
        if point[0] == 100.0 && point[1] == 0.0
            next_curves.push(point)
        else
            point_next = curves[index+1]

            next_curves.push(point)

            x = (point[0]*2+point_next[0])/3.0
            y = (point[1]*2+point_next[1])/3.0
            next_curves.push([x,y])

            diff_x = x - point[0]
            diff_y = y - point[1]
            x = diff_x/2 - diff_y*(3**0.5)/2 + x
            y = diff_x*(3**0.5)/2 + diff_y/2 + y
            next_curves.push([x,y])

            x = (point[0]+point_next[0]*2)/3.0
            y = (point[1]+point_next[1]*2)/3.0
            next_curves.push([x,y])
        end
    end
    curves = next_curves
end

curves.each do |point|
    puts "#{format("%.5f", point[0])} #{format("%.5f", point[1])}"
end