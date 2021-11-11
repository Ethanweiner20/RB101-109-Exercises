# Convert a String to a Signed Number!

# PROBLEM

=begin

Write a method that takes a String of digits, and returns the appropriate number
as an integer.

Clarifications:
- The String may have a leading + or - sign
- Return a positive # if leading character is a "+" or no sign
- Return a negative # if leading character is a "-"
- You can assume the string contains a valid number
- Input is assumed to be base 10

=end

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
  'a' => 10, 'b' => 11, 'c' => 12, 'd' => 13, 'e' => 14,
  'f' => 15
}

def string_to_signed_integer(string)
  case string[0]
  when '+' then string_to_integer(string.delete_prefix("+"))
  when '-' then -string_to_integer(string.delete_prefix("-"))
  else          string_to_integer(string)
  end
end

def string_to_integer(string)
  digits = string.downcase.chars.map { |char| DIGITS[char] }
  digits_to_integer(digits, 10)
end

def digits_to_integer(digits, base)
  accumulator = 0
  exponent = digits.length - 1

  digits.each do |digit|
    accumulator += digit * base**exponent
    exponent -= 1
  end

  accumulator
end

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100

# Further Exploration

def string_to_signed_integer_v2(string)
  signed_integer = string_to_integer(string[1..-1])

  case string[0]
  when '-' then -signed_integer
  when '+' then signed_integer
  else          string_to_integer(string)
  end
end
