require 'pry'

# Solution 1: Concatenation

def rotate_rightmost_digits(number, n)
  digits = number.to_s.chars
  (digits[0...-n] + rotate_array(digits[-n..-1])).join.to_i
end

def rotate_array(array)
  array[1..-1] + array[0, 1]
end

puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917

# Solution 2: Reassignment

def rotate_rightmost_digits_v2(number, n)
  digits = number.to_s.chars
  digits[-n..-1] = rotate_array(digits[-n..-1])
  digits.join.to_i
end

puts rotate_rightmost_digits_v2(735291, 1) == 735291
puts rotate_rightmost_digits_v2(735291, 2) == 735219
puts rotate_rightmost_digits_v2(735291, 3) == 735912
puts rotate_rightmost_digits_v2(735291, 4) == 732915
puts rotate_rightmost_digits_v2(735291, 5) == 752913
puts rotate_rightmost_digits_v2(735291, 6) == 352917
