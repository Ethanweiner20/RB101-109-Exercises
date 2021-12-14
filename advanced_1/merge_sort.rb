# Merge Sort

# Solution 1: Recursive

def merge_sort(array)
  merge_pairs(divide(array))
end

def divide(array)
  if array.size <= 1
    array
  else
    middle_index = array.length / 2
    [divide(array[0...middle_index]), divide(array[middle_index..-1])]
  end
end

p divide([1]) == [1]
p divide([1, 2]) == [[1], [2]]
p divide([9, 5, 7, 1]) == [[[9], [5]], [[7], [1]]]

def merge_pairs(array)
  if array.size <= 1
    array
  else
    merge(merge_pairs(array.first), merge_pairs(array.last))
  end
end

def merge(list1, list2)
  if list1.empty?
    list2
  elsif list2.empty?
    list1
  elsif list1.first < list2.first
    [list1.first] + merge(list1[1..-1], list2)
  else
    [list2.first] + merge(list1, list2[1..-1])
  end
end

p merge_pairs([]) == []
p merge_pairs([1]) == [1]
p merge_pairs([[1], [2]]) == [1, 2]
p merge_pairs([[2], [1]]) == [1, 2]
p merge_pairs([[[9], [5]], [[7], [1]]]) == [1, 5, 7, 9]
p merge_pairs([[[[6], [2]], [7]], [[1], [4]]]) == [1, 2, 4, 6, 7]

puts merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
puts merge_sort([5, 3]) == [3, 5]
puts merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
puts merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
puts merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]