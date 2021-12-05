require 'pry'

# Fibonnaci Numbers (Last Digit)

def fibonacci_last(n)
  prev_last, curr_last = [0, 1]
  (n - 1).times do
    curr_last, prev_last = (curr_last + prev_last) % 10, curr_last
  end
  curr_last
end



# Further Exploration

# Mahematical Solution

# Use the knowledge of the pattern to determine the last digit
def fibonacci_last_fast(n)
  fibonacci_pattern_sequence = determine_fibonacci_pattern_sequence
  index = (n - 1) % fibonacci_pattern_sequence.length
  fibonacci_pattern_sequence[index]
end

# Determine the repeated pattern in the fibonacci sequence
def determine_fibonacci_pattern_sequence
  last_digits = [1, 1]
  loop do
    next_last_digit = (last_digits[-2] + last_digits[-1]) % 10

    # If this condition is met, we know that the pattern will begin repeating
    if last_digits[-1] == last_digits[0] && next_last_digit == last_digits[1]
      return last_digits[0..-2]
    else
      last_digits << next_last_digit
    end
  end
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
puts
p fibonacci_last_fast(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last_fast(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last_fast(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last_fast(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last_fast(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last_fast(123_456_789_987_745) # -> 5