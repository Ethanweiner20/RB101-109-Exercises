# Arithmetic Integer

# PROBLEM
# ============================================================================

=begin

Input(s):
- Two positive integers, _integer1_ and _integer2_

Output:
- Displayed results of operations being performed on the two integers

=end

# EXAMPLES/TESTS
# ============================================================================

=begin

==> Enter the first number:
23
==> Enter the second number:
17
==> 23 + 17 = 40
==> 23 - 17 = 6
==> 23 * 17 = 391
==> 23 / 17 = 1
==> 23 % 17 = 6
==> 23 ** 17 = 141050039560662968926103

=end

# DATA STRUCTURE(s)
# ============================================================================

=begin

We could store the operations directly in an array as symbols, iterate over the array, and display the result of the respective operation.

=end

# ALGORITHM
# ============================================================================

=begin

Set operations = Associated operations as symbols
Retrieve two positive integers _integer1_ and _integer2_

For each `operation` in `operations`
  display_computation(integer1, integer2, operation)
  
SUBPROCESS display_computation(integer1, integer2, operation)
  result = perform operation on two integers
  Display integer1 `operation`.to_str integer2 = `result`

=end

# CODE
# ============================================================================

OPERATIONS = [:+, :-, :*, :/, :%, :**]

def prompt(message)
  puts "==> #{message}"
end

def display_computation(integer1, integer2, operation)
  result = integer1.send(operation, integer2)
  prompt("#{integer1} #{operation} #{integer2} = #{result}")
end

prompt("Enter the first number:")
integer1 = gets.chomp.to_i

prompt("Enter the second number:")
integer2 = gets.chomp.to_i

OPERATIONS.each { |operation| display_computation(integer1, integer2, operation) }

# DISCUSSION

=begin

If we wanted to use floats, we would have to consider the edge case where the second number is zero, because division by zero returns a non-numerical answer.

Our options are:
- Allow the division by zero
- Perform input validation to enforce non-zero second integers
- Skip division when the second integer is zero

=end