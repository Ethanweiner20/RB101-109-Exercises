# Stringy Strings

# PROBLEM

=begin

Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

Input:
- A positive _integer_

Output:
- A string of alternating 1s and 0s whose length is _integer_

Clarifications:
- The Integer can not be 0

Requirements:
- The length of the string equals the _integer_ provided

Mental Model 1: Initialize a `digit` to 1. Iterate over _integer_, toggling `digit`. Concatenate `digit` to a string on every iteration.

Mental Model 2: Iterate over _integer_, adding a 1 for even integers (starting at 0), & adding a 0 for odd integers

=end

# EXAMPLES/TESTS

=begin

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

=end

# DATA STRUCTURE: Store the accumulated 1s and 0s in a string called `digits`.

# ALGORITHM

=begin

Given a positive _integer_:

Initialize `digit` to 1
Initialize `digits` to 0

For every iteration on _integer_:
- Append `digit` onto `digits`
- Toggle `digit`

=end

# CODE

# Mental model 1

def stringy(integer)
  digit = "1"
  digits = ''
  integer.times do
    digits << digit
    digit = digit == "1" ? "0" : "1"
  end
  digits
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# Mental model 2

def stringy_v2(integer)
  digits = ''
  integer.times { |index| digits << (index.even? ? '1' : '0') }
  digits
end

puts stringy_v2(6) == '101010'
puts stringy_v2(9) == '101010101'
puts stringy_v2(4) == '1010'
puts stringy_v2(7) == '1010101'

# Mental model 3

def stringy_v3(integer)
  digits = ''
  integer.times { |index| digits << ((index + 1) % 2).to_s }
  digits
end

puts stringy_v3(6) == '101010'
puts stringy_v3(9) == '101010101'
puts stringy_v3(4) == '1010'
puts stringy_v3(7) == '1010101'

# Further exploration

def stringy_v4(integer, start=1)
  digits = '' # Can be initialized to the start
  integer.times { |index| digits << ((index + start).odd? ? '1' : '0') }
  digits
end

puts stringy_v4(6) == '101010'
puts stringy_v4(6, 0) == '010101'

# Compute the modulus depending upon the start

# Further exploration
# Take the modulo of the index (shifted by start) divided by 2 in order to
# alternate digits in line with parity (even/odd) alternations in index

def stringy_v5(integer, start=1)
  digits = ''

  integer.times do |index|
    digit = (index + start) % 2
    digits << digit.to_s
  end

  digits
end

puts stringy_v5(6) == '101010'
puts stringy_v5(6, 0) == '010101'
