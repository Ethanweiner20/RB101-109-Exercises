# Countring the Number of Characters

# PROBLEM
# ============================================================================

=begin

Write a program that will ask a user for an input of a word or multiple words
and give back the number of characters. Spaces should not be counted as a
character.

Input:
- _string_ containing at least one word

Output:
- The number of non-space characters in _string_

Mental Model 1: Iterate through characters in string, increment a counter
variable unless character is a ' '

Mental Model 2: Use Array#reduce to accumulate a character count, skipping
incrementation if character is a ' '

Questions/Assumptions:
- _string_ must contain at least one character

Clarifications:
- Spaces should not be counted as a character

=end

# EXAMPLES/TESTS
# ============================================================================

=begin

Please write word or multiple words: walk
There are 4 characters in "walk".

Please write word or multiple words: walk, don't run
There are 13 characters in "walk, don't run".

=end

# ALGORITHM
# ============================================================================

=begin

Retrieve & validate the input string

For char in string
  Increment a counter unless char is a ' '

Return the counter

=end

# CODE
# ============================================================================

# Solution 1: Conditionally add characters

string = ''

loop do
  print "Please write word or multiple words: "
  string = gets.chomp
  break unless string.empty?
  puts "Invalid string. Please make sure your string has at least 1 character."
end

# Must provide an initial operand for #reduce, because by default, the first
# element of the caller is used as the operand, which is a character
num_characters = string.chars.reduce(0) do |counter, char|
  char == ' ' ? counter : counter + 1
end

puts "There are #{num_characters} characters in \"#{string}\""

# Solution 2: Delete spaces, and count all remaining characters

string = ''

loop do
  print "Please write word or multiple words: "
  string = gets.chomp
  break unless string.empty?
  puts "Invalid string. Please make sure your string has at least 1 character."
end

num_characters = string.delete(' ').length
puts "There are #{num_characters} characters in \"#{string}\""