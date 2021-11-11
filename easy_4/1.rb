# Short Long Short

# PROBLEM
# ============================================================================

=begin

Write a method that takes two strings as arguments, determines the longest of
the two strings, and then returns the result of concatenating the shorter
string, the longer string, and the shorter string once again.

Inputs:
- Two strings, _string1_ and _string2_

Output:
- A concatenated string, consisting of the shorter string + longer string +
shorter string

Clarifications:
- We can assume the strings are of different lengths (no need to deal w/ case
in which they are equal)

Questions:
- Can spaces be included? No (per examples)

=end

# EXAMPLES/TESTS
# ============================================================================

=begin

short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"

=end

# ALGORITHM
# ============================================================================

=begin

Given _string1_ and _string2_:

If string1.length > string2.length
  longer string = string1
  shorter string = string2
Elsif ...
  operation in reverse

# Now we have longer & shorter strings to access, just concatenate

shorter string + longer string + shorter string

=end

# CODE
# ============================================================================

# Spell out w/ conditional

def short_long_short(string1, string2)
  if string1.length > string2.length
    longer_string = string1
    shorter_string = string2
  elsif string1.length < string2.length
    longer_string = string2
    shorter_string = string1
  end

  shorter_string + longer_string + shorter_string
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"

# Use ternary operators

def short_long_short_v2(string1, string2)
  length_comparison = string1.length > string2.length

  longer_string = length_comparison ? string1 : string2
  shorter_string = length_comparison ? string2 : string1

  shorter_string + longer_string + shorter_string
end

puts short_long_short_v2('abc', 'defgh') == "abcdefghabc"
puts short_long_short_v2('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short_v2('', 'xyz') == "xyz"

def short_long_short_condensed(str1, str2)
  str1.length > str2.length ? str2 + str1 + str2 : str1 + str2 + str1
end
