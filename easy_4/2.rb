# What Century is That?

# PROBLEM
# ============================================================================

=begin

Write a method that takes a year as input and returns the century. The return
value should be a string that begins with the century number, and ends with
"st", "nd", "rd" or "th" as appropriate for that number.

Input:
- A _year_ (positive integer)

Output:
- The century of _year_

Assumptions:
- Only positive integer years can be inputted

Domain Knowledge: New centuries begin in years that end in 01:
- 1-100 = 1st century
- 101-200 = 2nd century
...
- 1901-2000 = 20th century

=end

# EXAMPLES/TESTS
# ============================================================================

=begin

century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

=end

# DATA STRUCTURE(s)
# ============================================================================

=begin

No special data structures are needed.

=end

# ALGORITHM
# ============================================================================

=begin

Given a _year_:

intermediate_value = (year - 1) / 100
century_number = intermediate_value + 1

Return ordinal(century_number)

SUBPROCESS ordinal(number)
  if the # ends w/ 11, 12, 13, return "th"
  else if the # ends w/ 1, 2, 3, return 1st, 2nd, 3rd respectively
  else return "th"

=end

# CODE
# ============================================================================

def century(year)
  century = ((year - 1) / 100) + 1
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  last_two_digits = century % 100
  return "th" if [11, 12, 13].include?(last_two_digits)

  last_digit = century % 10
  case last_digit
  when 1 then "st"
  when 2 then "nd"
  when 3 then "rd"
  else "th"
  end
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'
