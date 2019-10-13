n = gets.to_i
array = gets.chomp.split(" ").map(&:to_i)
$count = 0
class Array
    def merge_sort
      merge = ->(a, b) {
        result = []
        while a.size > 0 and b.size > 0
          result << if a[0] < b[0]
            a.shift
          else
            $count += a.size
            b.shift
          end
        end
        result + a + b
      }
      
      l = length
      return self if l <= 1
      q = l / 2
      merge.(self[0...q].merge_sort, self[q..-1].merge_sort)
    end
end
array.merge_sort
puts $count