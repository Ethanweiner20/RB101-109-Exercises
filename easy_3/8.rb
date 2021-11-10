# Palindromic Strings (Part 1)

# PROBLEM
# ============================================================================

=begin

Write a method that returns true if the string passed as an argument is a
palindrome, false otherwise.

Inputs:
- _string_

Output:
- Boolean indicating whether _string_ is a palindrome

Clarifications:
- Case, punctuation and spaces all matter (no need to convert string)

Mental Model 1: Compare characters array to reverse of characters array.

Mental Model 2: Iterate over characters with an index, checking if 
the sides of the array are the same.

=end

# EXAMPLES/TESTS
# ============================================================================

=begin

palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true

=end

# DATA STRUCTURE(s)
# ============================================================================

=begin

Convert string to a characters array for comparison purposes.

=end

# CODE
# ============================================================================

# Solution

def palindrome?(string)
  string == string.reverse
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true

# You could improve this efficiency by stopping at midway (since you have
# compared all characters at this point)
def palindrome_v2?(string)
  string.chars.each_index do |index|
    return false if string[index] != string[-1 - index]
  end
  true
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true

# Further Exploration

# Write a method that determines whether an array or string is palindromic
def palindromic?(collection)
  collection == collection.reverse
end

puts "Further Exploration"
puts palindromic?('madam') == true
puts palindromic?('Madam') == false          # (case matters)
puts palindromic?("madam i'm adam") == false # (all characters matter)
puts palindromic?('356653') == true
puts palindromic?([]) == true
puts palindromic?([1, 2, 1]) == true
puts palindromic?([1, 2, 3]) == false

def palindromic_brute_force?(collection)
  matches = []
  index = 0

  while index < collection.length
    matches.push(collection[index] == collection[-1 - index])
    index += 1
  end

  matches.all?(true)
end

puts "Further Exploration"
puts palindromic_brute_force?('madam') == true
puts palindromic_brute_force?('Madam') == false          # (case matters)
puts palindromic_brute_force?("madam i'm adam") == false # (all characters matter)
puts palindromic_brute_force?('356653') == true
puts palindromic_brute_force?([]) == true
puts palindromic_brute_force?([1, 2, 1]) == true
puts palindromic_brute_force?([1, 2, 3]) == false