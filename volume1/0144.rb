N = gets.to_i
hash = Hash.new

class Node
    attr_accessor :no
    attr_accessor :children
end

N.times do
    info = gets.chomp.split(" ").map(&:to_i)
    no = info.shift
    child_size = info.shift
    node = Node.new
    node.no = no
    node.children = info
    hash[no] = node
end

hash.values.each do |node|
    node.children = node.children.map {|i| hash[i] } 
end

memo = {}

P = gets.to_i
P.times do
    s,d,v=gets.chomp.split(" ").map(&:to_i)

    node = hash[s]
    if node != nil && memo[node.no] == nil
        memo[node.no] = {}
        memo[node.no][node.no] = 1
        nexts = [node]
        distance = 2
        while !nexts.empty?
            nexts = nexts.map {|e| e.children }.flatten.uniq

            nexts_pre = []
            nexts.each do |next_node|
                if memo[node.no][next_node.no] == nil
                    memo[node.no][next_node.no] = distance
                    nexts_pre.push(next_node)
                end
            end
            nexts = nexts_pre
            distance += 1
        end
    end

    distance = memo.dig(s, d)
    if distance == nil || distance > v
        puts "NA"
    else
        puts distance
    end
end