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
                node.parent = self
            else
                @children[0].insert(node)
            end
        else
            if @children[1] == nil
                @children[1] = node
                node.parent = self
            else
                @children[1].insert(node)
            end
        end
    end

    def delete(i)
        if @index == i && @parent != nil
            if @children[0] == nil && @children[1] == nil
                @parent.children = @parent.children.map {|e| e==self ? nil : e }
            elsif @children[0] == nil
                @parent.children = @parent.children.map {|e| e==self ? @children[1] : e }
                @children[1].parent = @parent
            elsif @children[1] == nil
                @parent.children = @parent.children.map {|e| e==self ? @children[0] : e }
                @children[0].parent = @parent
            else
                min_node = children[1]
                while min_node.children[0] do
                    min_node = min_node.children[0]
                end
                @index = min_node.index
                children[1].delete(@index)
            end
        end
        if @index >= i && @children[0] != nil
            children[0].delete(i)
        elsif @index < i && @children[1] != nil
            @children[1].delete(i)
        end
    end

    def find(i)
        return true if @index == i
        if @index >= i && @children[0] != nil
            return children[0].find(i)
        elsif @index < i && @children[1] != nil
            return @children[1].find(i)
        end
        false
    end
end

root_node = nil

gets.to_i.times do
    s,i=gets.chomp.split(" ")
    
    if s == "insert"
        i = i.to_i
        if root_node == nil
            root_node = Node.new
            root_node.index = i
        else
            node = Node.new
            node.index = i
            root_node.insert(node)
        end
    elsif s == "find"
        i = i.to_i
        if root_node != nil && root_node.find(i)
            puts "yes"
        else
            puts "no"
        end
    elsif s == "delete"
        i = i.to_i
        root_node.delete(i)
    else
        if root_node == nil
            puts ""
            puts ""
        else
            puts " " + root_node.inorder_array.map {|e|e.index}.join(" ")
            puts " " + root_node.preorder_array.map {|e|e.index}.join(" ")
        end
    end
end
