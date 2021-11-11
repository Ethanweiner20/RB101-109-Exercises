# Leap Years (Part 1)

# PROBLEM
# ============================================================================

=begin

Input:
- _year_ as a positive integer

Output:
- Boolean telling whether the _year_ is a leap year

Domain Knwoeldge: In the modern era under the Gregorian Calendar, leap years
occur in every year that is evenly divisible by 4, unless the year is also
divisible by 100. If the year is evenly divisible by 100, then it is not a leap
year unless the year is evenly divisible by 400.

Clarifications:
- The method takes positive integers as input

=end

# EXAMPLES/TESTS
# ============================================================================

=begin

leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == false
leap_year?(1) == false
leap_year?(100) == false
leap_year?(400) == true

=end

# DATA STRUCTURE(s)
# ============================================================================

=begin

No special data structures are needed here.

=end

# ALGORITHM
# ============================================================================

=begin

Solution 1:

Given a _year_:

return true if year % 4 == 0 unless year % 100 == 0
# Narrowed scope to years divisible by 100
return false unless year % 400 == 0
# Narrowed scoped to years divisible by 400
return true

Solution 2:

Given a _year_:

if year % 400 == 0 then return true
elsif year % 100 == 0 then return false
elsif year % 4 == 0 then return true
return false

If the year is divisible by 400, then it must be a leap year.
Else, as long as the year isn't divisible by 100, then it's a leap year. But
catch cases where the year is divisible by 100 first.

=end

# CODE
# ============================================================================

# Solution 1: Directly spell out logic in domain knowledge

def leap_year?(year)
  return false unless year % 4 == 0
  # Narrower scope: _year_ is divisible by 4
  return true unless year % 100 == 0
  # Narrower scope: _year_ is divisible by 100
  return false unless year % 400 == 0
  # Narrower scope: _year_ is divisible by 400
  true
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
puts leap_year?(400) == true

# Solution 2: Perform logic in reverse
# Deal with special conditions (least common cases) first (400 & 100)

def leap_year_v2?(year)
  if year % 400 == 0 then true
  elsif year % 100 == 0 then false
  else year % 4 == 0
  end
end

puts leap_year_v2?(2016) == true
puts leap_year_v2?(2015) == false
puts leap_year_v2?(2100) == false
puts leap_year_v2?(2400) == true
puts leap_year_v2?(240000) == true
puts leap_year_v2?(240001) == false
puts leap_year_v2?(2000) == true
puts leap_year_v2?(1900) == false
puts leap_year_v2?(1752) == true
puts leap_year_v2?(1700) == false
puts leap_year_v2?(1) == false
puts leap_year_v2?(100) == false
puts leap_year_v2?(400) == true

# Solution 3 (condensed)
# A leap year is either divisible by 400, or:
# it is divisible by 4 but not divisible by 100
# Any other conditions result in false

def leap_year_v3?(year)
  year % 400 == 0 || (year % 100 != 0 && year % 4 == 0)
end

puts leap_year_v3?(2016) == true
puts leap_year_v3?(2015) == false
puts leap_year_v3?(2100) == false
puts leap_year_v3?(2400) == true
puts leap_year_v3?(240000) == true
puts leap_year_v3?(240001) == false
puts leap_year_v3?(2000) == true
puts leap_year_v3?(1900) == false
puts leap_year_v3?(1752) == true
puts leap_year_v3?(1700) == false
puts leap_year_v3?(1) == false
puts leap_year_v3?(100) == false
puts leap_year_v3?(400) == true

# Further Exploration

=begin

leap_year? will fail for any years divisible by 400. Years divisible by 400
are leap years no matter what. But according to the logic, if a year is
divisible by 100, and also happens to be divisible by 400, then that year is not
a leap year. Since every year divisible by 400 is also divisible by 100, any
year divisible by 400 will be caught by the first branch, and return fals.e

=end

# 2 ways to reverse order:

# def leap_year?(year)
#   return false unless year % 4 == 0
#   # Narrower scope: _year_ is divisible by 4
#   return true unless year % 100 == 0
#   # Narrower scope: _year_ is divisible by 100
#   return false unless year % 400 == 0
#   # Narrower scope: _year_ is divisible by 400
#   true
# end

# def leap_year_v2?(year)
#   if year % 4 == 0
#     if year % 100 == 0
#       return year % 400 == 0
#     end
#     return true
#   end

#   false
# end

puts leap_year_v2?(2016) == true
puts leap_year_v2?(2015) == false
puts leap_year_v2?(2100) == false
puts leap_year_v2?(2400) == true
puts leap_year_v2?(240000) == true
puts leap_year_v2?(240001) == false
puts leap_year_v2?(2000) == true
puts leap_year_v2?(1900) == false
puts leap_year_v2?(1752) == true
puts leap_year_v2?(1700) == false
puts leap_year_v2?(1) == false
puts leap_year_v2?(100) == false
puts leap_year_v2?(400) == true

=begin

The second solution feels more complex. In the first solution, we immediately
return deal w/ the uncommon cases, each of which has higher precedence than
the the following more common cases. In this way, the order of our conditional
logic mimics the order of importance for each condition:

year % 400 == 0 >> year % 100 == 0 >> year % 4 == 0

This match is intuitive, and arguably less complex.

That said, the second solution will, on average result in less
comparisons needing to be made. The first solution runs the less likely
comparisons first, which means it is more likely that it will have to proceed
to the next branch/comparison. The second solutions runs the more likely
comparisons first, making it less likely to proceed to the next/comparison.

=end
