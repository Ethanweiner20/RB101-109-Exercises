# Combine Two Lists

# Solution 1: Indexing

def interleave(array1, array2)
  result = []
  array1.each_with_index { |ele, index| result.push(ele, array2[index]) }
  result
end

puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# Solution 2: Use transpose (most concicse)

def interleave_v2(array1, array2)
  [array1, array2].transpose.flatten
end

puts interleave_v2([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']