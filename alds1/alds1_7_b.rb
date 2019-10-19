N = gets.to_i
class Node
    attr_accessor :index, :children, :parent, :sibling

    def initialize()
        @children = []
        @parent = nil
        @sibling = nil
    end

    def depth
        parent == nil ? 0 : parent.depth + 1
    end

    def degree
        children.length
    end

    def height
        if children.empty?
            0
        else
            children.map {|e| e.height }.max + 1
        end
    end
end
nodes = Array.new(N) { Node.new }
N.times do
    line=gets.chomp.split(" ").map(&:to_i)
    node = nodes[line[0]]
    node.index = line[0]
    
    node.children = line[1..2].select{|e| e!=-1 }.map {|e| nodes[e] }
    node.children.each do |child|
        child.parent = node
    end

    if node.children.length == 2
        nodes[line[1]].sibling = nodes[line[2]]
        nodes[line[2]].sibling = nodes[line[1]]
    end
end

nodes.each_with_index do |node|
    is_root = node.parent == nil
    is_leaf = node.children.empty?
    has_sibling = node.sibling != nil
    puts "node #{node.index}: parent = #{is_root ? -1 : node.parent.index}, sibling = #{has_sibling ? node.sibling.index : -1}, degree = #{node.degree}, depth = #{node.depth}, height = #{node.height}, #{is_root ? "root" : is_leaf ? "leaf" : "internal node"}"
end