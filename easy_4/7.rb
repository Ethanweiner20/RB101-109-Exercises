# Convert a String to a Number!

# PROBLEM
# ============================================================================

=begin

Input:
- A string of digits _digits_string_

Output:
- The Integer corresponding to the digits

Clarifications:
- You can not use any String to number conversion methods
- Assume validation is not required

=end

# EXAMPLES/TESTS
# ============================================================================

=begin

string_to_integer('4321') == 4321
string_to_integer('570') == 570

=end

# DATA STRUCTURE(s)
# ============================================================================

=begin

No special data structure is needed.

=end

# ALGORITHM
# ============================================================================

=begin

Solution 1: Retrieve ASCII representations of each character to retrieve digits,
and add digit * 10^x to the accumulator

Given a _digits_string_

accumulator = 0
exponent = digits_string.length - 1

For each char in digits_string:
  Retrieve ASCII representation of char
  Subtract a constant from the ASCII representation to retrieve the digit
  accumulator += 10^(exponent) * digit
  exponent -= 1

return accumulator

=end

# CODE
# ============================================================================

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
  'a' => 10, 'b' => 11, 'c' => 12, 'd' => 13, 'e' => 14,
  'f' => 15
}

# Solution 1: Iterate over each ASCII representation, convert to a digit,
# and add the accumulator

def string_to_integer(string)
  accumulator = 0
  exponent = string.length - 1

  string.each_byte do |byte|
    digit = byte - 48
    accumulator += digit * 10**exponent
    exponent -= 1
  end

  accumulator
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570

# Solution 2: Transform string to digits -> create integer from digits

def string_to_integer_v2(string)
  digits = string.bytes.map { |byte| byte - 48 }
  digits_to_integer(digits, 10)
end

# base-agnostic solution

# Based directly on power expansion formula for any base:
# digit_1 * 16^n + digit_2 * 16^n-1 ... + digit_n * 16^0
def digits_to_integer(digits, base)
  accumulator = 0
  exponent = digits.length - 1

  # Power expansion formula
  digits.each do |digit|
    accumulator += digit * base**exponent
    exponent -= 1
  end

  accumulator
end

puts string_to_integer_v2('4321') == 4321
puts string_to_integer_v2('570') == 570

# Further Exploration

# Domain knowledge: Each character in a hexidecimal represents either a one-
# or two-digit base-10 integer



def hexadecimal_to_integer(hex)
  hex_digits = hex.downcase.chars.map { |char| DIGITS[char] }
  digits_to_integer(hex_digits, 16)
end

puts hexadecimal_to_integer('4D9f') == 19871
