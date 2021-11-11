# Leap Years (Part 2)

=begin

We can separate leap years into 2 separate methods:
- leap_year_gregorian
- leap_year_julian

We can decide which method to run based on the provided year.

=end

def leap_year?(year)
  if year < 1752
    julian_leap_year?(year)
  else
    gregorian_leap_year?(year)
  end
end

def gregorian_leap_year?(year)
  year % 400 == 0 || (year % 100 != 0 && year % 4 == 0)
end

def julian_leap_year?(year)
  year % 4 == 0
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
puts leap_year?(1700) == true
puts leap_year?(1) == false
puts leap_year?(100) == true
puts leap_year?(400) == true

=begin

Further Exploration: I live in Massachusetts, which was a colony of the British
Empire during 1752, and so we adopted the Gregorian calendar system in 1752.

Apparently, other calendar systems (like the Chinese and Islamic) are based on
the motion of the moon around the earth, rather than the motion of the earth
around the sun.

The change to the Gregorian calendar resulted from the fact that leap years
were overcompensating for the actual length of a solar year.

=end
