# Repeat Yourself

# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

# PROBLEM

=begin

Inputs:
- _str_ to print
- Positive _integer_ that determines # of times to print

Output:
- The String printed the specified # of times

Mental model 1: Iterate _integer_ times, and print _str_ (with a newline) each time

=end

# EXAMPLES/TESTS

repeat('Hello', 3)  # => Hello\nHello\nHello\n
repeat('Hello', 1)  # => Hello\n
repeat('Hello', 0)  # Not allowed as input
repeat('Hello', -1) # Not allowed as input
repeat('', 3)       # => \n\n\n
repeat('A', 3)      # => A\nA\n\A\n

# DATA STRUCTURE: No data structure is needed to solve this problem with my solution

# ALGORITHM

=begin

1. Iterate _integer_ times
2. For each iteration, print the _str_ (with a newline)

=end

# CODE

def repeat(str, integer)
  integer.times { puts str }
end
