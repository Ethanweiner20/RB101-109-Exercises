# After Midnight (Part 2)

# PROBLEM
# ============================================================================

=begin

Write two methods that each take a time of day in 24 hour format, and return the
# of minutes before & after midnight, respectively.

Explicit Requirements:
- Input: String representing the _24hr_time_
- Output: # of minutes before midnight, # of minutes after midnight
- You may not use Ruby's Date and Time methods

Questions:
- Is 24:00 included in the 24-hour format? Yes. It is considered 0 hours before
and after midnight

Implicit Requirements:
- 24-hour format is in the form "HH:MM"
- The # of minutes returned is positive, regardless of whether the method
is before or after midnight

Assumptions:
- "24:00" is the highest 24-hr time that can be obtained

Mental Model:
- After Midnight: Parse the hours and minutes from the _24hr_time. Perform
arithmetic to determine minutes: [0] + hours * 60 + minutes
- Before midnight: Parse the hours and minutes from the _24hr_time. Perform
arithmetic to determine minutes before midnight, by subtracting from the total
minutes in a day

=end

# EXAMPLES/TESTS
# ============================================================================

=begin

after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0

=end

# DATA STRUCTURE(s)
# ============================================================================

=begin

No special data structures are needed here.

=end

# ALGORITHM
# ============================================================================

=begin

After Midnight:

Given a _24hr_time_ string:

- hours = Retrieve hours substring from time, and convert to an integer
- minutes = Retrieve minutes substring from time, and convert to an integer
- Determine the minutes after midnight for those hours & minutes

Before Midnight:

Given a _24hr_time_ string:

- hours = Retrieve hours substring from time, and convert to an integer
- minutes = Retrieve minutes substring from time, and convert to an integer
- Determine the minutes before midnight for those hours & minutes

SUB-PROBLEM: Determine minutes after nearest midnight

Given _hours_ and _minutes_:

total_minutes = Multiply hours by 60 and add the leftover minutes
total_minutes = 0 if total_minutes == MINUTESS_IN_DAY
- Adjusts for the "24:00" case
  
SUB-PROBLEM: Determine minutes before nearest midnight

minutes after previous midnight = Multiply hours by 60 and add the leftover
minutes
total_minutes = Minutes in a day minus the the minutes after previous midnight

=end

# CODE
# ============================================================================

MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = 60 * 24

def after_midnight(time)
  hours, minutes = time.split(":").map(&:to_i)
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
end

def before_midnight(time)
  minutes_before_midnight = MINUTES_PER_DAY - after_midnight(time)
  minutes_before_midnight = 0 if minutes_before_midnight == MINUTES_PER_DAY
  minutes_before_midnight
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0

# Further Exploration

=begin

The Date and Time classes would allow us to parse the input time into a Date or
Time object.
- For #after_midnight, we could compare that Date/Time object with an object 
initialized at the midnight before
- For #before object, we could compare that Date/Time object with an object
initialized at the midnight after

=end