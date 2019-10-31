H = gets.to_i
nodes = gets.chomp.split(" ").map(&:to_i)

def left(i)
    (i+1)*2-1
end

def right(i)
    (i+1)*2
end

def max_heapify(nodes, i)
    l = left(i)
    r = right(i)
    largest = i
    if l < H && nodes[l] > nodes[i]
        largest = l
    end
    if r < H && nodes[r] > nodes[largest]
        largest = r
    end
    if largest != i
        nodes[i],nodes[largest] = nodes[largest],nodes[i]
        max_heapify(nodes, largest)
    end
end

(0..(H/2-1)).to_a.reverse.each do |i|
    max_heapify(nodes, i)
end

puts " " + nodes.join(" ")