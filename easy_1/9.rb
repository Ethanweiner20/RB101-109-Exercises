# Sum of Digits

# PROBLEM

=begin

Write a method that takes one argument, a positive integer, and returns the sum of its digits.

Input:
- A positive _integer_

Output:
- An integer equivalent to the sum of all digits in _integer_

Requirements:
- [Optional] Write w/o any basic looping constructs; alternatives: recursion or other iterative techniques

Mental Model: Collect an array of digits using a subprocess. Sum the digits.

=end

# EXAMPLES/TESTS

=begin

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

=end

# DATA STRUCTURE: We could use an array to accumulate the digits.

# ALGORITHM

=begin

When writing these algorithms, let the process be a freer brainstorm. Don't pressure yourself into getting the right algorithm first try. Instead, explore a variety of options, and be aware when one option doesn't feel the best.

Algorithm 1:

Given a positive _integer_:

- SUBPROCESS Retrieve the `digits` in _integer_
- Sum the digits, and store in `sum`
- Return the `sum`

Algorithm 2:

Given a positive _integer_

- Determine the last digit of _integer_: _integer_ % 10
- Determine the sum of the integer without the final digit: sum(integer / 10)
- If the given integer is zero, return 0 (the sum of 0 is 0)
- RETURN sum the two results

=end

# CODE

# Algorithm 1: Retrieve digits first, then sum

def sum(integer)
  digits(integer).reduce(:+)
end

def digits(integer)
  return [] if integer == 0 # Base case
  digits(integer / 10) << integer.remainder(10)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

# Algorithm 2: Sum concurrently while recurring through digits

def sum_v2(integer)
  return 0 if integer == 0 # Base case
  integer.remainder(10) + sum_v2(integer / 10)
end

puts sum_v2(23) == 5
puts sum_v2(496) == 19
puts sum_v2(123_456_789) == 45

# Algorithm 3 & 4: Sum while iterating over characters

def sum_v3(integer)
  integer.to_s.chars.reduce(0) { |sum, char| sum + char.to_i }
end

puts sum_v3(23) == 5
puts sum_v3(496) == 19
puts sum_v3(123_456_789) == 45

def sum_v4(integer)
  integer.to_s.chars.map(&:to_i).reduce(:+)
end

puts sum_v4(23) == 5
puts sum_v4(496) == 19
puts sum_v4(123_456_789) == 45
