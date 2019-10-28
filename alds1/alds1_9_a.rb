class Node
    attr_accessor :key, :left, :right, :parent

    def initialize(key)
        @key = key
    end

    def depth
        parent == nil ? 0 : parent.depth + 1
    end

    def to_s
        key_s = "key = #{@key}, "
        parent_s =  @parent==nil ? "" : "parent key = #{@parent.key}, "
        left_s = @left==nil ? "" : "left key = #{@left.key}, "
        right_s = @right==nil ? "" : "right key = #{@right.key}, "
        key_s + parent_s + left_s + right_s
    end
end

gets
nodes = []
gets.chomp.split(" ").map(&:to_i).each_with_index do |key, index|
    node = Node.new(key)
    nodes.push(node)
    next if index == 0
    parent = nodes[(index+1)/2-1]
    if index.odd?
        parent.left = node
    else
        parent.right = node
    end
    node.parent = parent
end
nodes.each_with_index do |node, index|
    puts "node #{index+1}: #{node.to_s}"
end
