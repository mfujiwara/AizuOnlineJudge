N = gets.to_i
class Node
    attr_accessor :children, :parent

    def initialize()
        @children = []
        @parent = -1
    end
end
nodes = Array.new(N) { Node.new }
N.times do
    line=gets.chomp.split(" ").map(&:to_i)
    node_index = line[0]
    children_count = line[1]
    next if children_count == 0
    children = line[2..-1]
    nodes[node_index].children = children
    children.each do |child|
        nodes[child].parent = node_index
    end
end

nodes.each_with_index do |node, index|
    parent = node.parent
    depth = 0
    while parent != -1 do
        depth+=1
        parent = nodes[parent].parent
    end
    puts "node #{index}: parent = #{node.parent}, depth = #{depth}, #{node.parent==-1 ? "root" : node.children.empty? ? "leaf" : "internal node"}, [#{node.children.join(", ")}]"
end