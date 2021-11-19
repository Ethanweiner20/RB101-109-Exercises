# Combining Arrays

# Solution 1

def merge(array1, array2)
  merged = []

  array1.each { |ele| merged << ele }
  array2.each { |ele| merged << ele unless merged.include?(ele) }

  merged
end

puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# Solution 2: Using #uniq

def merge_v2(array1, array2)
  (array1 + array2).uniq
end

puts merge_v2([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
