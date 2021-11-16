# After Midnight (Part 1)

# PROBLEM
# ============================================================================

=begin

Write a method that takes the # of minutes before or after midnight and returns
the corresponding time of day in 24 hour format (hh:mm).

Input:
- _minutes_after_midnight

Output:
_ A string representing the time of day in 24 hour format (hh:mm)

Explicit Requirements:
- The method can accept ANY integer value

Implicit Requirements:
- Leading zeroes are allowed in the final string
- No AM/PM designation is required
- Use military time (hh range from 0 to 23)

Mental Model: Retrieve the # of minutes AFTER the NEAREST midnight using
modulus division. Convert minutes to corresponding hourly time.

=end

# EXAMPLES/TESTS
# ============================================================================

=begin

time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"

=end

# DATA STRUCTURE(s)
# ============================================================================

=begin

No special data structures are needed here.

=end

# ALGORITHM
# ============================================================================

=begin

MINUTES_IN_DAY = 60 * 24

Given the _minutes_:

- Retrieve the # of _minutes_ after the nearest midnight
- Convert this # of minutes to an hourly representation

=end

# Relative Minutes

=begin

Algo 1:

Given the number of _minutes_:

Divide those minutes by the # of minutes in a day
Retrieve the modulus of that division
That modulus should be the # of minutes relative to the nearest midnight

Algo 2:

Given the number of _minutes_:

If _minutes_ is +:
- Repeatedly subtract MINUTES_IN_DAY from minutes until its within the desired
range ()

Otherwise:
- Repeatedly add MINUTES_IN_DAY until its within the desired range

e.g. MINUTES_IN_DAY + 60 minutes ==> Subtracting MINUTES_IN_DAY ==> 60 minutes
relative to the nearest midnight of those minutes==

e.g. -60 minutes ==> Add MINUTES_IN_DAY ==> MINUTES_IN_DAY - 60 (which is what
we want)

=end

# CODE
# ============================================================================

MINUTES_IN_HOUR = 60
HOURS_IN_DAY = 24
MINUTES_IN_DAY = MINUTES_IN_HOUR * HOURS_IN_DAY

# Retrieve minutes after the nearest midnight
def normalize_minutes(minutes)
  minutes % MINUTES_IN_DAY
end


# Another solution

# def normalize_minutes(minutes)
#   until minutes >= 0 && minutes < MINUTES_IN_DAY
#     if minutes > 0
#       minutes -= MINUTES_IN_DAY
#     else
#       minutes += MINUTES_IN_DAY
#     end
#   end
#   minutes
# end


puts normalize_minutes(10) == 10
puts normalize_minutes(-60) == MINUTES_IN_DAY - 60
puts normalize_minutes(MINUTES_IN_DAY + 60) == 60

# Retrieve military time corresponding to _minutes_
def minutes_to_time(total_minutes)
  hours, minutes = total_minutes.divmod(MINUTES_IN_HOUR)
  "#{format('%02d', hours)}:#{format('%02d', minutes)}"
end

puts minutes_to_time(60) == "01:00"
puts minutes_to_time(185) == "03:05"
puts minutes_to_time(60 * 14) == "14:00"

def time_of_day(minutes)
  relative_minutes = normalize_minutes(minutes)
  minutes_to_time(relative_minutes)
end

# puts time_of_day(0) == "00:00"
# puts time_of_day(-3) == "23:57"
# puts time_of_day(35) == "00:35"
# puts time_of_day(-1437) == "00:03"
# puts time_of_day(3000) == "02:00"
# puts time_of_day(800) == "13:20"
# puts time_of_day(-4231) == "01:29"

# Further Exploration

=begin

Problem 1: Since a % b returns a positive number if b is positive, we can
normalize the minutes by using the expression: total_minutes % MINUTES_IN_DAY

Problem 2 & 3:

Ways I could use the Date and Time classes are:
- Automatically format the given time
- Automatically readjust the time
- Consider the day of the week in the calculation

# PROBLEM
# ============================================================================

=begin

A date can be represented as the # of minutes before or after the midnight
between Saturday & Sunday.

Write a method that takes a time using this minute-based format and returns the
day of the week and time of day in 24 hour format (hh:mm).

Input:
- _minutes_ before or after midnight between Saturday & Sunday

Output:
- Day of the week
- Time of that day

Clarifications:
- A negative _minutes_ represents minutes before midnight, a positive _minutes_
represents minutes after midnight

=end

# EXAMPLES/TESTS
# ============================================================================

=begin

day_and_time(0) # => "Sunday 00:00"
day_and_time(-4231) # => "Thursday 01:29"
day_and_time(200) # => "Sunday 03:20"

=end

# DATA STRUCTURE(s)
# ============================================================================

=begin

There are no special data structures needed here.

=end

# ALGORITHM
# ============================================================================

=begin

Given a total number of _delta_minutes_ after midnight between Saturday &
Sunday:

- Initialize a date that starts at midnight between Saturday & Sunday. All other
values can be arbitrary. **
- Add the _minutes_ to that date **
- Display the day & time of that date **

=end

# CODE
# ============================================================================

# NOTE: Dates/time computations in this implementation rely on an abritrarily 
# chosen reference date: 2021-11-14 at 00:00

REFERENCE_TIMESTAMP = Time.new(2021, 11, 14).to_i

def day_and_time(delta_minutes)
  date = retrieve_date(delta_minutes)
  date.strftime("%A %H:%M")
end

def retrieve_date(delta_minutes)
  delta_seconds = delta_minutes * 60
  date_in_seconds = REFERENCE_TIMESTAMP + delta_seconds
  Time.at(date_in_seconds)
end

# puts day_and_time(-4231) == "Thursday 01:29"