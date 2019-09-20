while true do
    @w,@q=gets.chomp.split(" ").map(&:to_i)
    if @w == 0
        exit
    end

    w_max = (2 ** @w) # 2進数で w+1 桁

    wall = 0
    cats = {}
    @q.times do
        inputs = gets.chomp.split(" ").map(&:to_i)
        if inputs.length == 2
            # wakeup
            no = inputs[1]
            wall -= cats[no]
        else
            # sleep
            no = inputs[1]
            cat = (2 ** inputs[2])-1
            pos = 0
            while (cat & wall != 0) && (cat < w_max) do
                cat = cat * 2
                pos += 1
            end
            if cat < w_max
                cats[no] = cat
                wall += cat
                puts pos
            else
                puts "impossible"
            end
        end
    end
    puts "END"
end