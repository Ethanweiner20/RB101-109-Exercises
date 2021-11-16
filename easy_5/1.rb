# ASCII String Value

# PROBLEM
# ============================================================================

=begin

Write a method that determines and returns the ASCII string value of a string
that is passed in as an argument.

Domain Knowledge: The ASCII string value is the sum of the ASCII values of every
character in the string

Helper Methods;
- String#ord: Determine the ASCII value of an individual character

Mental Model: Retrieve the ASCII value of each character, and sum these values

Input:
- _string_ to be analyzed

Output:
- A number representing the ASCII value of the string passed

Questions:
- Are ASCII values for a given character case-sensitive? (e.g. a is different
than A)? Yes ... doesn't really matter
- Should we include spaces in our computation?

Clarifications:
- An empty string returns 0

=end

# EXAMPLES/TESTS
# ============================================================================

=begin

ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0

=end

# DATA STRUCTURE(s)
# ============================================================================

=begin

We will want access to each individual character, so we will iterate over an
array of those characters, and likewise, collect the ASCII values in an array.

=end

# ALGORITHM
# ============================================================================

=begin

Given a _string_:

Initialize the ASCII value to zero

For each character in the string:
  Retrieve the ASCII value of that character w/ String#ord
  Add that ASCII value to the overall ASCII value

Return the ASCII value

=end

# CODE
# ============================================================================

def ascii_value(string)
  ascii_value = 0
  string.each_char { |char| ascii_value += char.ord }
  ascii_value
end

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0

# Refactored

def ascii_value_v2(string)
  string.chars.reduce(0) { |sum, char| sum + char.ord }
end

puts ascii_value_v2('Four score') == 984
puts ascii_value_v2('Launch School') == 1251
puts ascii_value_v2('a') == 97
puts ascii_value_v2('') == 0

# Further Exploration

=begin

We need to find an Integer method that converts an ASCII integer to the
corresponding character.

The correct method is Integer#chr:

char.ord.chr == char

If we try this with a longer String, the output will be false. This is because
#ord will retrieve the ASCII representation of only the first character in
`char`. So, #chr will convert the resulting Integer back to the associated
character, not the whole string.

=end