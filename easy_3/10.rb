# Palindromic Numbers

# PROBLEM

=begin

Inputs:
- An _integer_

Output:
- A Boolean indicating whether _integer_ is a palindromic number

Assumptions:
- The method requires integer input -> Validation is not required
- The integer does not begin with zeroes

=end

# CODE

def palindrome?(string)
  string == string.reverse
end

def palindromic_number?(integer)
  palindrome?(integer.to_s)
end

puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true

# Further Exploration

=begin

FINAL CONCLUSION

The method will no longer work, because prefixing a number with 0 causes Ruby
to assume that number is a base-8 number, so it converts it immediately to its
base 10 form. We could try converting back to base 8 here, but the prepending
zeros will have been lost.

For this to work, we'd somehow have to capture those prepending zeroes before
Ruby converts it into base 8. Which would either require modification of the
Ruby source code itself, or a "hackish" solution that really just inputs
some non-numerical value first, such as a String.

=end
