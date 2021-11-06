# Odd Numbers

# PROBLEM

=begin

Print all odd numbers from 1 to 99, inclusive, to the consule, with each number on a separate line.

Input: None

Output: All odd #s from 1 to 99, inclusive, printed to the console on separate lines

Requirements:
- Numbers are printed on separate lines (use #puts to print)

Domain knowledge: A number is odd if and only if number % 2 == 1

=end

# ALGORITHM

=begin

For each number in [1, 99]
  print number if number % 2 == 1
  print a new line

=end

# Solution 1

def print_odd_numbers
  100.times { |number| puts number if number.odd? }
end

print_odd_numbers

def print_odd_numbers_v2
  (1..99).each { |number| puts number if number.odd? }
end

print_odd_numbers_v2

def print_odd_numbers_v3
  puts "Version 3"
  1.upto(99) { |number| puts number if number.odd? }
end

print_odd_numbers_v3

def print_odd_numbers_v4
  odd_numbers = (1..99).select(&:odd?)
  puts "Version 4:"
  puts odd_numbers
end

print_odd_numbers_v4
