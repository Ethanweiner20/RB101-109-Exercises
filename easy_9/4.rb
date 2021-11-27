# Counting Up

=begin

Ideas:

- Procedural: Loop and add to an array
- Clever: Map a Range to an array

=end

# Solution 1: Procedular

def sequence(bound)
  counter = 1
  result = []

  while counter <= bound
    result << counter
    counter += 1
  end

  result
end

puts sequence(5) == [1, 2, 3, 4, 5]
puts sequence(3) == [1, 2, 3]
puts sequence(1) == [1]

def sequence_v2(bound)
  (1..bound).to_a
end

puts sequence_v2(5) == [1, 2, 3, 4, 5]
puts sequence_v2(3) == [1, 2, 3]
puts sequence_v2(1) == [1]

# Further Exploration

=begin

Assuming that the result does not need to be sorted in ascending order,
it makes sense that an argument not greater than 0 should result in a sequence
from 1 DOWN to the bound.

By default, converting a descending Range to an Array results in an empty array.

We could deal with this by conditionally checking the value of the argument,
and creating an ascending Range whose resulting Array is reversed:

=end

def sequence_v3(bound)
  bound > 0 ? (1..bound).to_a : (bound..1).to_a.reverse
end

puts sequence_v3(5) == [1, 2, 3, 4, 5]
puts sequence_v3(3) == [1, 2, 3]
puts sequence_v3(1) == [1]
puts sequence_v3(0) == [1, 0]
puts sequence_v3(-1) == [1, 0, -1]
puts sequence_v3(-2) == [1, 0, -1, -2]

def sequence_v4(bound)
  bound > 0 ? 1.upto(bound).to_a : 1.downto(bound).to_a
end

puts sequence_v4(5) == [1, 2, 3, 4, 5]
puts sequence_v4(3) == [1, 2, 3]
puts sequence_v4(1) == [1]
puts sequence_v4(0) == [1, 0]
puts sequence_v4(-1) == [1, 0, -1]
puts sequence_v4(-2) == [1, 0, -1, -2]
