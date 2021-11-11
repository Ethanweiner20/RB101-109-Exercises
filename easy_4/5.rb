# Multiples of 3 and 5

# PROBLEM
# ============================================================================

=begin

Write a method that searches for all multiples of 3 or 5 that lie between 1 and
some other number, and then computers the sum of those multiples.

Input:
- A positive integer _upper_

Output:
- The sum of the multiples of 3 and 5 that are in the range [1, upper]

Clarifications:
- The supplied number is included in the range of possible multiples

=end

# EXAMPLES/TESTS
# ============================================================================

=begin

multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168

=end

# DATA STRUCTURE(s)
# ============================================================================

=begin

We will use an array to collect the multiples.

=end

# ALGORITHM
# ============================================================================

=begin

Solution 1: Compute multiples, and then sum

Given a number _upper_:

Returnm the sum of multiples(upper)

SUBPROCESS multiples(upper)
  Select all numbers in 1..upper that are divisible by 3 or 5

Solution 2: Sum in parallel while determining multiples

Given a number _upper:

sum = 0
for num in 1..upper
  sum += num if multiple(num)

SUBPROCESS multiple(num)
  Return true if number is divisible by 3 or 5

=end

# CODE
# ============================================================================

# Solution 1

def multisum(upper)
  multiples(upper).sum
end

def multiples(upper)
  (1..upper).select { |num| num % 3 == 0 || num % 5 == 0 }
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168

def multisum_v2(upper)
  (1..upper).reduce(0) do |sum, num|
    multiple(num, 3) || multiple(num, 5) ? sum + num : sum
  end
end

def multiple(num, divisor)
  num % divisor == 0
end

puts multisum_v2(3) == 3
puts multisum_v2(5) == 8
puts multisum_v2(10) == 33
puts multisum_v2(1000) == 234168

# Using reduce is more succinct, but is perhaps slightly less clear.