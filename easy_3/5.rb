# Squaring an Argument

# PROBLEM

=begin

Using the `multiply` method from the "Multiplying Two Numbers" problem, write
a method that computes the square of its argument.

Domain Knowledge: n^2 = n * n

=end

def square(num)
  multiply(num, num)
end

def multiply(num1, num2)
  num1 * num2
end

puts square(5) == 25
puts square(-8) == 64

# Further Exploration: You would have to perform a loop that repeatedly
# multiplies the previous result by itself. This could be down recursively:

=begin
def power(num, power)
  return 1 if power == 0 # Base case
  ... num ... power(num, power - 1) ...
end

num^power = num * num^(power - 1)
=end

# Note: Only works for non-negative powers
def power(num, power)
  return 1 if power == 0
  multiply(num, power(num, power - 1))
end

puts power(1, 0) == 1
puts power(2, 1) == 2
puts power(2, 2) == 4
puts power(2, 3) == 8
