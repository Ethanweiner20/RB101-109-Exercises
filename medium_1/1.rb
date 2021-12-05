# Rotation (Part 1)

# Solution 1

=begin
Initial Version:

def rotate_array(array)
  first_element = array[0, 1]
  rest_of_elements = array[1..-1]
  rest_of_elements + first_element
end
=end

# Refactored

def rotate_array(array)
  array[1..-1] + array[0, 1]
end

puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
puts rotate_array(x) == [2, 3, 4, 1]
puts x == [1, 2, 3, 4]

# Solution 2: Procedural

def rotate_array_v2(array)
  rotated_array = []
  index = 1
  until index >= array.length
    rotated_array << array[index]
    index += 1
  end
  rotated_array << array[0]
  rotated_array
end

puts rotate_array_v2([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array_v2(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array_v2(['a']) == ['a']

x = [1, 2, 3, 4]
puts rotate_array_v2(x) == [2, 3, 4, 1]
puts x == [1, 2, 3, 4]

# Further Exploration

def rotate_string(string)
  rotate_array(string.chars).join
end

puts rotate_string('launch') == 'aunchl'
puts rotate_string('launch school') == 'aunch schooll'

def rotate_integer(integer)
  rotate_string(integer.to_s).to_i
end

puts rotate_integer(5) == 5
puts rotate_integer(567) == 675
