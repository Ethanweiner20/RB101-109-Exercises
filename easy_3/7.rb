# PROBLEM
# ============================================================================

=begin

Inputs:
- _array_

Output:
- An array containing only the elements at even indices

Mental Model 1: Add every element to a new array whose index % 2 == 0
Mental Model 2: Toggle a Boolean variable (initialized to true) that adds an
element when that variable is true

=end

# EXAMPLES/TESTS
# ============================================================================

=begin

oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []

=end

# DATA STRUCTURE(s)
# ============================================================================

=begin

We will use an array to accumulate the elements.

=end

# ALGORITHM
# ============================================================================

=begin

Solution 1:

Given an _array_:

Set result = []

For each `index` and `value` in _array_:
  Append value if index % 2 == 0 

Return result

Solution 2:

Given an _array_

Set result = []
Set include_element = true

For each value in _array_
  Append value if include_element
  include_element = !include_element

Return result

Solution 3: 

Given an _array_

Set result = []
Set index = 0 

While index < array.size
  Append array[index]
  index += 2

Return result

=end

# CODE
# ============================================================================

# Solution 1

def oddities(array)
  result = []
  array.each_with_index { |ele, index| result << ele if index.even? }
  result
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []

def oddities_v2(array)
  result = []
  include_element = true

  array.each do |ele|
    result << ele if include_element
    include_element = !include_element
  end

  result
end

puts oddities_v2([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities_v2([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities_v2(['abc', 'def']) == ['abc']
puts oddities_v2([123]) == [123]
puts oddities_v2([]) == []

def oddities_v3(array)
  result = []
  index = 0

  while index < array.length
    result << array[index]
    index += 2
  end

  result
end

puts oddities_v3([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities_v3([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities_v3(['abc', 'def']) == ['abc']
puts oddities_v3([123]) == [123]
puts oddities_v3([]) == []

def oddities_v4(array)
  array.filter.with_index { |_, index| index.even? }
end

# Companion method

def every_other_element(array, start=0)
  result = []
  array.each_with_index { |ele, index| result << ele if (index + start).even? }
  result
end

def every_other_element_v2(array, start=0)
  result = []
  include_element = start == 0

  array.each do |ele|
    result << ele if include_element
    include_element = !include_element
  end

  result
end