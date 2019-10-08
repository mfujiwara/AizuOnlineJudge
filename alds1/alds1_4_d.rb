n,k=gets.chomp.split(" ").map(&:to_i)
ws = []
n.times do
    ws.push(gets.to_i)
end

ret = (ws.max..ws.inject(:+)).bsearch do |e|
    cnt = 1
    truck = 0
    ws.each do |w|
        if truck + w <= e
            truck+=w
        else
            cnt+=1
            truck=w
        end
    end
    cnt <= k
end
puts ret