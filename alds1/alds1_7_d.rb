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
preorders = gets.chomp.split(" ").map(&:to_i)
inorders = gets.chomp.split(" ").map(&:to_i)

def setNode(preorders, inorders, parent=nil)
    node = Node.new
    node.index = preorders[0]
    node.parent = parent
    left_num = inorders.index(node.index)
    right_num = preorders.length - left_num - 1
    left_node = (left_num == 0) ? nil : setNode(preorders[1..left_num], inorders[0..(left_num-1)], node)
    right_node = (right_num == 0) ? nil : setNode(preorders[(-right_num)..(-1)], inorders[(-right_num)..(-1)], node)
    node.children = [left_node, right_node]
    node
end

root_node = setNode(preorders, inorders)

puts root_node.postorder_array.map {|e|e.index}.join(" ")