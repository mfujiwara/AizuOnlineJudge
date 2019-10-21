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

    def preorder_array
        left_array = children[0] == nil ? [] : children[0].preorder_array
        right_array = children[1] == nil ? [] : children[1].preorder_array
        [[self], [left_array], [right_array]].flatten
    end

    def inorder_array
        left_array = children[0] == nil ? [] : children[0].inorder_array
        right_array = children[1] == nil ? [] : children[1].inorder_array
        [[left_array], [self], [right_array]].flatten
    end

    def postorder_array
        left_array = children[0] == nil ? [] : children[0].postorder_array
        right_array = children[1] == nil ? [] : children[1].postorder_array
        [[left_array], [right_array], [self]].flatten
    end
end
nodes = Array.new(N) { Node.new }
N.times do
    line=gets.chomp.split(" ").map(&:to_i)
    node = nodes[line[0]]
    node.index = line[0]
    
    node.children = line[1..2].map {|e| e==-1 ? nil : nodes[e] }
    node.children.each do |child|
        next if child == nil
        child.parent = node
    end

    if node.children.length == 2
        nodes[line[1]].sibling = nodes[line[2]]
        nodes[line[2]].sibling = nodes[line[1]]
    end
end

root = nodes.select {|e| e.parent == nil }[0]

puts "Preorder"
puts " " + root.preorder_array.map{|e|e.index}.join(" ")
puts "Inorder"
puts " " + root.inorder_array.map{|e|e.index}.join(" ")
puts "Postorder"
puts " " + root.postorder_array.map{|e|e.index}.join(" ")
