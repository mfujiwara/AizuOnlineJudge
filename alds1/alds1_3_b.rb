N,Q=gets.chomp.split(" ").map(&:to_i)
queues = []
N.times do
    name,time=gets.chomp.split(" ")
    queues.push([name, time.to_i])
end

cnt = 0
while !queues.empty? do
    queue = queues.shift
    if queue[1] <= Q
        cnt += queue[1]
        puts "#{queue[0]} #{cnt}"
    else
        cnt += Q
        queue[1] -= Q
        queues.push(queue)
    end
end