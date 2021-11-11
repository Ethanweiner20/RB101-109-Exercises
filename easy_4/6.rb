# PROBLEM
# ============================================================================

=begin

Write a method that takes an Array of numbers, and returns an Array with the
same number of elements, and each element has the running total from the
original Array.

Input: _array_ of numbers
Output: Running totals

Ideas:
# reduce might really come in handy here -- accumulate running totals...

=end

# EXAMPLES/TESTS
# ============================================================================

=begin

running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []

=end

# DATA STRUCTURE(s)
# ============================================================================

=begin

Use an array to accumulate running totals

=end

# ALGORITHM
# ============================================================================

=begin

Solution 1: Use #reduce to collect an array of running totals

Solution 2: Keep a running_total tracker variable that we continually append
to array (most straightforward)

=end

# CODE
# ============================================================================

# Solution 1

def running_total(numbers)
  running_total = 0
  running_totals = []

  numbers.each do |num|
    running_total += num
    running_totals << running_total
  end

  running_totals
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []

# Solution 2 (using map)
def running_total_v2(numbers)
  running_total = 0
  numbers.map { |number| running_total += number }
end

puts running_total_v2([2, 5, 13]) == [2, 7, 20]
puts running_total_v2([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total_v2([3]) == [3]
puts running_total_v2([]) == []

# Solution 3 (using inject)
def running_total_v3(numbers)
  numbers.inject([]) do |running_totals, number|
    running_total = running_totals.last ? running_totals.last + number : number
    running_totals + [running_total]
  end
end

puts running_total_v3([2, 5, 13]) == [2, 7, 20]
puts running_total_v3([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total_v3([3]) == [3]
puts running_total_v3([]) == []

def running_total_v4(numbers)
  numbers.each_with_object([]) do |number, running_totals|
    running_total = running_totals.last ? running_totals.last + number : number
    running_totals << running_total
  end
end

puts running_total_v4([2, 5, 13]) == [2, 7, 20]
puts running_total_v4([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total_v4([3]) == [3]
puts running_total_v4([]) == []
