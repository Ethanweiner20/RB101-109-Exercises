# List of Digits

# PROBLEM

=begin

Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

Inputs:
- A positive _integer_ whose digits will be extracted

Outputs:
- A list of digits in _integer_

Problem: You can't index into a number, like you can a string. Therefore, you must determine a way to receive a single digit answer.

Clarifications:
- The array must present the digits in order

Domain Knowledge: An integer's remainder when divided by 10 will provide its last digit.

Mental model 1: Convert _integer_ to a string. Iterate over and print each character in the string.

Mental model 2: Divide by 10 to obtain the last digit, recursively repeat for the quotient

=end

# EXAMPLES/TESTS

=begin

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
puts digit_list(0)                            # Invalid
puts digit_list(1) == [1]                     # => true
puts digit_list(999) == [9, 9, 9]              # => true

=end

# DATA STRUCTURE: We will accumulate our resulting digits in an array.

# ALGORITHM

=begin

Algorithm 1 (String conversion)

1. Convert integer to a string
2. Iterate over each character in the string
3. Convert each character to an integer
4. Push the resulting integer onto an accumulating array
5. Return the array

Algorithm 2 (Without String conversion)

1. Divide _integer_ by 10. Add the remainder to the beginning of the array. Store the _quotient_.
2. Divide the _quotient by 10. Add the remainder to the beginning of the array.
3. Repeat step 2 until the quotient is zero. The remainder from this division is the final remainder.

Algorithm 3 (Recursive)

1. Determine the remainder when dividing _integer_ by 10. This gives us our rightmost digit.
2. Determine the rest of the digits recursively.
3. Combine these two results by appending the rightmost digit from step 1 to the recursively found digits from step 2.
4. Base case: If the integer is zero, we have reached the end of our recursion. Zero is not considered a digit, so return an empty array.

=end

# CODE

# Mental model 1

def digit_list_v1(integer)
  integer.to_s.chars.map(&:to_i)
end

puts digit_list_v1(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list_v1(7) == [7]                     # => true
puts digit_list_v1(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list_v1(444) == [4, 4, 4]             # => true
puts digit_list_v1(1) == [1]                     # => true
puts digit_list_v1(999) == [9, 9, 9]             # => true

# Mental model 2: Iterative version

def digit_list_v2(integer)
  digits = []
  loop do
    result = integer.divmod(10)
    digits.unshift(result[1])
    integer = result[0]
    break if integer == 0
  end
  digits
end

puts digit_list_v2(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list_v2(7) == [7]                     # => true
puts digit_list_v2(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list_v2(444) == [4, 4, 4]             # => true
puts digit_list_v2(1) == [1]                     # => true
puts digit_list_v2(999) == [9, 9, 9]             # => true

# Mental model 2: Recursive version

def digit_list_v3(integer)
  return [] if integer == 0 # Base case
  digit_list_v3(integer / 10) << integer.remainder(10)
end

puts digit_list_v3(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list_v3(7) == [7]                     # => true
puts digit_list_v3(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list_v3(444) == [4, 4, 4]             # => true
puts digit_list_v3(1) == [1]                     # => true
puts digit_list_v3(999) == [9, 9, 9]             # => true

=begin

Improvements:
You can extract items from an array as variables using the following syntax:
v1, v2,... = [1, 2, ...]

=end
