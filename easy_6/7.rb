def halvsies(array)
  middle_index = retrieve_middle_index(array.length)
  array1 = array.slice(0, middle_index)
  array2 = array.slice(middle_index, array.length - middle_index)
  [array1, array2]
end

def retrieve_middle_index(array_length)
  (array_length / 2.0).ceil
end

puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

# Solution 2: Using #partition

def halvsies_v2(array)
  array.partition.with_index { |_, index| index < (array.length / 2.0).ceil }
end

puts halvsies_v2([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies_v2([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies_v2([5]) == [[5], []]
p halvsies_v2([]) == [[], []]

# Further Exploration

=begin

Division by 2.0 coerces the result into a float. This is important because
if we only divided by 2, the result would be coreced into an integer,
automatically rounding down any fractional values. So #ceil would be called on
the resulting integer, whose return value will just be the same integer. We need
a float value to round up.

=end