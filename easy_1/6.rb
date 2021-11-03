# Reverse It (Part 2)

# PROBLEM

=begin

Write a method that takes one argument, a string containing one or more words, and returns the given string with words that contain five or more characters reversed.

Inputs:
- A _string_ with at least one word

Output:
- A string w/ each word in _string_ (w/ >= 5 characters) reversed

Clarifications:
- Each string will consist of only letters and spaces
- Spaces should be included only when more than one word is present
- It is case sensitive (don't need to worry about siwtching cases)

Mental Model: Split into words, reverse each word, join the words together

=end

# DATA STRUCTURE: We will use an an array to store the words. When reversing each word individually, we will just reverse it as a string.

# ALGORITHM (skip for this problem)

=begin

Informal:

Given a string called "string";

Extract words from the string (in order)
For each word in words:
  Reverse each word
  Append that word to the reversed_words array
Join the reversed words back together

=end

# CODE

def reverse_words(string)
  reversed_words = []

  string.split.each do |word|
    reversed_words << (word.length >= 5 ? word.reverse : word)
  end

  reversed_words.join(" ")
end

# EXAMPLES/TESTS

puts reverse_words("")                      # => ""
puts reverse_words("the")                   # => the
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('   Professional  ')     # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
puts reverse_words('     Launch School   ') # => hcnuaL loohcS

# Using map

def reverse_words_v2(string)
  string.split.map { |word| word.length >= 5 ? word.reverse : word }.join(' ')
end

puts reverse_words_v2("")                      # => ""
puts reverse_words_v2("the")                   # => the
puts reverse_words_v2('Professional')          # => lanoisseforP
puts reverse_words_v2('   Professional  ')     # => lanoisseforP
puts reverse_words_v2('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words_v2('Launch School')         # => hcnuaL loohcS
puts reverse_words_v2('     Launch School   ') # => hcnuaL loohcS
