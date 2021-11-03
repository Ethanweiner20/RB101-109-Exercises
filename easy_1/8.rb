# Array Average

# PROBLEM

=begin

Write a method that takes on argument, an array containing integers, and returns the avreage of all numbers in the array. The array will never be empty and the numbers will always be positive integers. Your result should also be an integer.

Input:
- An array of positive _integers_

Output:
- An integer representing the average of all _integers_

Clarifications:
- Use integer division

Questions:
- Could we use an Array#sum method?

Mental model: Accumulate a sum of the integers, and divide by the total number of integers.

=end

def average(integers)
  sum = 0
  integers.each { |integer| sum += integer }
  sum / integers.length
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# Built-in sum method

def average_v2(integers)
  integers.sum / integers.length
end

puts average_v2([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average_v2([1, 5, 87, 45, 8, 8]) == 25
puts average_v2([9, 47, 23, 95, 16, 52]) == 40

# Using reduce

def average_v3(integers)
  sum = integers.reduce { |sum, integer| sum + integer }
  sum / integers.length
end

puts average_v3([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average_v3([1, 5, 87, 45, 8, 8]) == 25
puts average_v3([9, 47, 23, 95, 16, 52]) == 40

# Further exploration

def average_v4(integers)
  sum = integers.reduce { |sum, integer| sum + integer }
  sum.to_f / integers.length
end

puts average_v4([1, 6]) == 3.5
