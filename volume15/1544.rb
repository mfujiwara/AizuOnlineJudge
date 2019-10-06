N,M,C=gets.chomp.split(" ").map(&:to_i)
@array=gets.chomp.split(" ").map(&:to_i)

def calc(r)
    max_rl = Array.new(N)
    max_r = Array.new(N)
    max_l = Array.new(N)
    deq_up = []
    deq_down = []
    (0..(N-1)).each do |i|
        if !deq_up.empty?
            deq_up.shift if deq_up[0] < i - r
            up_val = @array[i] + i*C
            while !deq_up.empty? && up_val > @array[deq_up[-1]] + deq_up[-1]*C do
                deq_up.pop
            end
        end
        deq_up.push(i)
        max_l[i] = @array[deq_up[0]] - (i-deq_up[0])*C
    end
    (0..(N-1)).to_a.reverse.each do |i|
        if !deq_down.empty?
            deq_down.shift if deq_down[0] > i + r
            down_val = @array[i] - i*C
            while !deq_down.empty? && down_val > @array[deq_down[-1]] - deq_down[-1]*C do
                deq_down.pop
            end
        end
        deq_down.push(i)
        max_r[i] = @array[deq_down[0]] + (i-deq_down[0])*C
    end
    (0..(N-1)).each do |i|
        max_rl[i] = max_l[i] > max_r[i] ? max_l[i] : max_r[i]
    end
    max_rl.inject(:+)
end

ret = (0..(N-1)).to_a.bsearch { |e| calc(e) >= M }
if ret 
    puts ret
else
    puts "-1"
end
