# Convert a Number to a String!

CHARS = ('0'..'9').to_a

# ALGORITHM

=begin

Given an _integer_:

Retrieve the individual digits from _integer_
Map the digits to their associated string representations
Concatentate the strings

=end

# Solution 1: Convert to digits -> Convert to characters

def integer_to_string(integer)
  digits(integer).map { |digit| CHARS[digit] }.join
end

def digits(integer)
  return [integer] if integer / 10 == 0 # Base case
  digits(integer / 10) << integer % 10 # Append final digit
end

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'

# Recur along the digits of the integer, appending the associated
# character along the way
def integer_to_string_v2(integer)
  return CHARS[integer] if integer / 10 == 0 # Base case
  integer_to_string_v2(integer / 10) + CHARS[integer % 10] # Append final digit
end

puts integer_to_string_v2(4321) == '4321'
puts integer_to_string_v2(0) == '0'
puts integer_to_string_v2(5000) == '5000'

# Further Exploration

=begin

Mutating String methods that do not end with a "!"

- clear
- concat
- insert: Insert another string at index

Mutating String methods that end with a "!", but don't have a non-mutating form

Every String method that ends with a "!" has a non-mutating form.
I suppose this means that generally, every method that ends with a "!"
is mutating.

Array class:

Hash class:



=end
