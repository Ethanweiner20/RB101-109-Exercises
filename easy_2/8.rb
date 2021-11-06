# Sum or Product of Consecutive Integers

# PROBLEM

=begin

Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

Clarifications:
- The range is inclusive: [1, entered integer]

Mental Model 1: Compose a range of integers [1, entered integer], and then reduce those integers with the desired operation

Mental Model 2: Iterate integer times (e.g. using #upto), adding/multiplying each operation to an accumulator

=end

# EXAMPLES/TESTS

=begin

>> Please enter an integer greater than 0:
5
>> Enter 's' to compute the sum, 'p' to compute the product.
s
The sum of the integers between 1 and 5 is 15.


>> Please enter an integer greater than 0:
6
>> Enter 's' to compute the sum, 'p' to compute the product.
p
The product of the integers between 1 and 6 is 720.

=end

# CODE

# Solution 1
# Conditionally pass operation to reduction

def valid_integer?(input)
  input.to_i.to_s == input && input.to_i > 0
end

def valid_operation?(operation)
  %w(s p).include?(operation)
end

integer_input = ''
loop do
  puts ">> Please enter an integer greater than 0:"
  integer_input = gets.chomp
  break if valid_integer?(integer_input)
  puts "Invalid integer."
end

operation_input = ''
loop do
  puts ">> Enter 's' to compute the sum, 'p' to compute the product:"
  operation_input = gets.chomp.downcase
  break if valid_operation?(operation_input)
  puts "Invalid operation."
end

# Convert to proper inputs
integer = integer_input.to_i
operation = case operation_input
            when "s" then :+
            when "p" then :*
            end

result = (1..integer).inject(operation)
puts "The #{operation == :+ ? 'sum' : 'product'} of the integers between 1 and #{integer} is #{result}"

# Solution 2
# Least favorite: Requires conditional checking for every loop

puts ">> Please enter an integer greater than 0:"
integer = gets.to_i

operation = ''
loop do
  puts ">> Enter 's' to compute the sum, 'p' to compute the product."
  operation = gets.chomp.downcase
  break if operation == 's' || operation == 'p'
  puts "Please enter a valid answer."
end

result = nil

1.upto(integer) do |num|
  case operation
  when 's'
    result ||= 0
    result += num
  when 'p'
    result ||= 1
    result *= num
  end
end

puts "The #{operation == 's' ? 'sum' : 'product'} of the integers between 1 and #{integer} is #{result}"

# Solution 3
# Conditionally perform a method

def compute_sum(integer)
  result = 0
  1.upto(integer) { |num| result += num }
  result
end

def compute_product(integer)
  result = 1
  1.upto(integer) { |num| result *= num }
  result
end

puts ">> Please enter an integer greater than 0:"
integer = gets.to_i

operation = ''
loop do
  puts ">> Enter 's' to compute the sum, 'p' to compute the product."
  operation = gets.chomp.downcase
  break if operation == 's' || operation == 'p'
  puts "Please enter a valid answer."
end

case operation
when 's' then result = compute_sum(integer) 
when 'p' then result = compute_product(integer) 
else puts "Invalid operation!"
end

puts "The #{operation == 's' ? 'sum' : 'product'} of the integers between 1 and #{integer} is #{result}"
