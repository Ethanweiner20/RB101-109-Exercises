# Reversed Arrays (Part 2)

=begin

Basic algorithm:

- Initialze an empty array
- Iterate over the original array backwards
  - Append each element to the new array

=end

def reverse(array)
  reversed_array = []
  index = array.length - 1

  while index >= 0
    reversed_array << array[index]
    index -= 1
  end

  reversed_array
end

puts reverse([1,2,3,4]) == [4,3,2,1]          # => true
puts reverse(%w(a b e d c)) == %w(c d e b a)  # => true
puts reverse(['abc']) == ['abc']              # => true
puts reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
puts list.object_id != new_list.object_id  # => true
puts list == [1, 3, 2]                     # => true
puts new_list == [2, 3, 1]                 # => true

# Further Exploration

def reverse_v2(array)
  array.inject([]) { |reversed, element| reversed.unshift(element) }
end

puts reverse_v2([1,2,3,4]) == [4,3,2,1]          # => true
puts reverse_v2(%w(a b e d c)) == %w(c d e b a)  # => true
puts reverse_v2(['abc']) == ['abc']              # => true
puts reverse_v2([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse_v2(list)              # => [2, 3, 1]
puts list.object_id != new_list.object_id  # => true
puts list == [1, 3, 2]                     # => true
puts new_list == [2, 3, 1]                 # => true