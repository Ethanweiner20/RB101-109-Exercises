# Merge Sorted Lists

# Solution 1: Procedural

def merge(list1, list2)
  merged_list = []
  index1 = 0
  index2 = 0
  
  loop do
    if index1 == list1.length
      merged_list += list2[index2..-1]
      break
    elsif index2 == list2.length
      merged_list += list1[index1..-1]
      break
    elsif list1[index1] < list2[index2]
      merged_list << list1[index1]
      index1 += 1
    else
      merged_list << list2[index2]
      index2 += 1
    end
  end

  merged_list
end

puts merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
puts merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
puts merge([], [1, 4, 5]) == [1, 4, 5]
puts merge([1, 4, 5], []) == [1, 4, 5]

# Solution 2: Recursive

def merge_v2(list1, list2)
  if list1.empty?
    list2
  elsif list2.empty?
    list1
  elsif list1.first < list2.first
    [list1.first] + merge_v2(list1[1..-1], list2)
  else
    [list2.first] + merge_v2(list1, list2[1..-1])
  end
end

puts merge_v2([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
puts merge_v2([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
puts merge_v2([], [1, 4, 5]) == [1, 4, 5]
puts merge_v2([1, 4, 5], []) == [1, 4, 5]