# Multiplying Two Numbers

# PROBLEM
# ============================================================================

=begin

Create a method that takes two arguments, multiplies them together, and returns
the result.

Input:
- Two numbers _num1_ and _num2_

Output:
- The product of the two numbers

Assumptions:
- The method can only input numbers (no input validation required)

If the method could accept other types as inputs, we would have to:
- Validate types
- Consider that strings would use the String#`*` method, which would perform
different behavior: "Ethan" * 3 ==> "EthanEthanEthan"

Further Exploration:
- If the first argument is an Array, and the other is an integer _n_: The array
is concatenated onto itself n - 1 times

=end

def multiply(num1, num2)
  num1 * num2
end

puts multiply(5, 3) == 15

p multiply([1, 2, 3], 4)
