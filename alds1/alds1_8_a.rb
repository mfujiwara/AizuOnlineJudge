class Node
    attr_accessor :index, :children, :parent

    def initialize()
        @children = [nil, nil]
        @parent = nil
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

    def insert(node)
        if @index >= node.index
            if @children[0] == nil
                @children[0] = node
            else
                @children[0].insert(node)
            end
        else
            if @children[1] == nil
                @children[1] = node
            else
                @children[1].insert(node)
            end
        end
    end
end

root_node = nil

gets.to_i.times do
    s,i=gets.chomp.split(" ")
    
    if s == "print"
        if root_node == nil
            puts ""
            puts ""
        else
            puts " " + root_node.inorder_array.map {|e|e.index}.join(" ")
            puts " " + root_node.preorder_array.map {|e|e.index}.join(" ")
        end
    else
        i = i.to_i
        if root_node == nil
            root_node = Node.new
            root_node.index = i
        else
            node = Node.new
            node.index = i
            root_node.insert(node)
        end
    end
end
