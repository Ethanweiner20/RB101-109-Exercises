# Rotation (Part 3)

def max_rotation(number)
  number.to_s.length.downto(2).reduce(number) do |rotation, n|
    rotate_rightmost_digits(rotation, n)
  end
end

def rotate_rightmost_digits(number, n)
  digits = number.to_s.chars
  (digits[0...-n] + rotate_array(digits[-n..-1])).join.to_i
end

def rotate_array(array)
  array[1..-1] + array[0, 1]
end

puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845

# Further Exploration

# Part 1

def max_rotation_v2(number)
  digits = number.to_s.chars
  0.upto(digits.length - 2) do |index|
    digits << digits.delete_at(index)
  end
  digits.join.to_i
end

puts max_rotation_v2(735291) == 321579
puts max_rotation_v2(3) == 3
puts max_rotation_v2(35) == 53
puts max_rotation_v2(105) == 15 # the leading zero gets dropped
puts max_rotation_v2(8_703_529_146) == 7_321_609_845