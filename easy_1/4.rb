# How Many?

# PROBLEM

=begin

Write a method that counts the number of occurrences of each element in a given array.

Inputs:
- _array_ with elements to be counted

Output:
- A display of the # of occurrences of each element in _array_

Requirements:
- Words in array are case-sensitive (i.e. differently cased elements should not be considered the same element)

Mental Model: Iterate over the array, incrementing the # of occurrences for a hash key upon each occurrence of an item. Hash keys are initialized to 0.

=end

# DATA STRUCTURE: We will use a hash to collect the number of occurrences.

# ALGORITHM

=begin

Create a _hash_ w/ a default value of zero

For each element of _array_:
  Increment the associated key in _hash_ by 1

Print the hash

=end

# CODE

def count_occurrences(array)
  occurrences = Hash.new(0)
  array.each { |element| occurrences[element] += 1 }
  print_occurrences(occurrences)
end

def print_occurrences(occurrences)
  occurrences.each { |element, count| puts "#{element} => #{count}" }
end

# EXAMPLES/TESTS

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

vehicles = []

count_occurrences(vehicles)

# Prints nothing

vehicles = ['car']

count_occurrences(vehicles)

# car => 1

vehicles = [
  'car', 'car', 'CAR', 'CAR', 'truck', 'Truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

# car => 4
# CAR => 2
# truck => 3
# Truck => 1
# SUV => 1
# motorcycle => 2

numbers = [0, 1, 2, 2, 3, 3, 3]

count_occurrences(numbers)

# 0 => 1
# 1 => 1
# 2 => 2
# 3 => 3

# FURTHER EXPLORATION

def count_occurrences_case_insensitive(array)
  occurrences = Hash.new(0)
  array.each { |element| occurrences[element.downcase] += 1 }
  print_occurrences(occurrences)
end

vehicles = [
  'car', 'car', 'CAR', 'CAR', 'truck', 'Truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences_case_insensitive(vehicles)