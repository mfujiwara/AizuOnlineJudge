n = gets.to_i
nodes = {}

class Node
    attr_accessor :string
    attr_accessor :no
    attr_accessor :valid
    attr_accessor :child
end

(1..n).each { |i|
    s = gets.chomp
    node = Node.new
    node.string = s
    node.no = i
    node.valid = false
    node.child = [node]
    nodes[i] = node
}


node_array = nodes.values.sort_by { |e| e.string }

(0..(n-2)).each do |i|
    ((i+1)..(n-1)).each do |j|
        if node_array[j].string.start_with?(node_array[i].string)
            node_array[i].child.push(node_array[j])
        else
            break
        end
    end
end

q = gets.to_i
q.times do
    # print node_array.map { |e| [e.no, e.valid] }
    # puts
    k, index =gets.chomp.split(" ").map(&:to_i)
    if k == 1
        nodes[index].valid = true
    elsif k == 2
        nodes[index].valid = false
    else
        node = nodes[index].child.select { |e| e.valid }.first
        if node 
            puts node.no
        else
            puts -1
        end
    end
end
