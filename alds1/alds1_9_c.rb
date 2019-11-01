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
    if l < nodes.length && nodes[l] > nodes[i]
        largest = l
    end
    if r < nodes.length && nodes[r] > nodes[largest]
        largest = r
    end
    if largest != i
        nodes[i],nodes[largest] = nodes[largest],nodes[i]
        max_heapify(nodes, largest)
    end
end

def reverse_heapify(nodes)
    i = nodes.length - 1
    while i > 0 do
        j = (i+1)/2-1
        if nodes[i] > nodes[j]
            nodes[i], nodes[j] = nodes[j], nodes[i]
        else
            break
        end
        i = j
    end
end

nodes = []
loop do
    operation=gets.chomp.split(" ")
    if operation[0] == "insert"
        k = operation[1].to_i
        nodes.push(k)
        reverse_heapify(nodes)
    elsif operation[0] == "extract"
        puts nodes[0]
        nodes[0] = -1
        max_heapify(nodes, 0)
    else
        break
    end
end
