# Even Numbers

# PROBLEM

=begin

Print all even numbers from 1 to 99, inclusive, to the consule, with each number on a separate line.

Input: None

Output: All even #s from 1 to 99, inclusive, printed to the console on separate lines

Requirements:
- Numbers are printed on separate lines (use #puts to print)

Domain knowledge: A number is even if and only if number % 2 == 0

=end

# ALGORITHM

=begin

For each number in [1, 99]
  print number if number % 2 == 0
  print a new line

=end

# Solution 1

def print_even_numbers
  100.times { |number| puts number if number.even? }
end

print_even_numbers

def print_even_numbers_v2
  (1..99).each { |number| puts number if number.even? }
end

print_even_numbers_v2

def print_even_numbers_v3
  puts "Version 3"
  1.upto(99) { |number| puts number if number.even? }
end

print_even_numbers_v3

def print_even_numbers_v4
  even_numbers = (1..99).select(&:even?)
  puts "Version 4:"
  puts even_numbers
end

print_even_numbers_v4
