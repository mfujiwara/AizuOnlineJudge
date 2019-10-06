N = gets.to_i
array=gets.chomp.split(" ")
class Node
    attr_accessor :mark, :value, :index
end

array1 = array.map do |e|
    node = Node.new
    node.mark = e[0]
    node.value = e[1].to_i
    node
end

array2 = array.map do |e|
    node = Node.new
    node.mark = e[0]
    node.value = e[1].to_i
    node
end

array3 = array.map.with_index do |e, i|
    node = Node.new
    node.mark = e[0]
    node.value = e[1].to_i
    node.index = i
    node
end

def bubbleSort(array)
    (0..(N-2)).each do |i|
        ((i+1)..(N-1)).to_a.reverse.each do |j|
            if array[j].value < array[j-1].value 
                tmp = array[j]
                array[j] = array[j-1]
                array[j-1] = tmp
            end
        end
    end
    array
end

def selectionSort(array)
    (0..(N-1)).each do |i|
        mini = i
        (i..(N-1)).each do |j|
            mini = j if array[j].value < array[mini].value
        end
        tmp = array[i]
        array[i] = array[mini]
        array[mini] = tmp
    end
    array
end

bubbleSorted = bubbleSort(array1).map {|e| "#{e.mark}#{e.value}" }.join(" ")
selectionSorted = selectionSort(array2).map {|e| "#{e.mark}#{e.value}" }.join(" ")
sorted = array3.sort_by {|e| e.value*40+e.index }.map {|e| "#{e.mark}#{e.value}" }.join(" ")

puts bubbleSorted
puts bubbleSorted == sorted ? "Stable" : "Not stable"
puts selectionSorted
puts selectionSorted == sorted ? "Stable" : "Not stable"
