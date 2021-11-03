# Odd

# Wire a method that takes one integer argument, which may be positive, negative, or zero. This method returns true if the number's absolute value is odd. You may assume that the argument is a valid negative integer.

# CODE

def is_odd?(integer)
  integer % 2 != 0
end

# PROBLEM

=begin

Inputs:
- Positive, negative, or zero _integer_ to check

Ouput:
- Boolean that signifies whether _integer_'s absolute value is odd

Requirements:
- #odd? or #even? can not be used

Clarifications:
- Zero is even
- The method can only accept integers

Domain-specific information: A number n is even if n % 2 == 0. Otherwise, n is odd.

=end

# EXAMPLES/TESTS

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true
puts is_odd?(-1)   # => true

# DATA STRUCTURE: No data structure is needed to solve this problem with my solution.

# ALGORITHM

=begin

1. Evaluate the integer mod 2
2. If the integer mod 2 is 0, return false (it is even). Otherwise, return true.

=end

# FURTHER EXPLORATION

# An integer is odd if its remainder, when divided by 2, is not equal to zero.

def is_odd_v2?(integer)
  integer.remainder(2) != 0
end

puts is_odd_v2?(2)    # => false
puts is_odd_v2?(5)    # => true
puts is_odd_v2?(-17)  # => true
puts is_odd_v2?(-8)   # => false
puts is_odd_v2?(0)    # => false
puts is_odd_v2?(7)    # => true
puts is_odd_v2?(-1)   # => true