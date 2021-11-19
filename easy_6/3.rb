# Fibonacci Number Location by Length

# Solution 1: Basic

def find_fibonacci_index_by_length(length)
  current = 1
  previous = 1
  index = 2

  until current.to_s.length >= length
    # Use multiple assignment to avoid temporary variable creation
    current, previous = current + previous, current
    index += 1
  end

  index
end

# puts find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
# puts find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
# puts find_fibonacci_index_by_length(10) == 45
# puts find_fibonacci_index_by_length(100) == 476
# puts find_fibonacci_index_by_length(1000) == 4782
# puts find_fibonacci_index_by_length(10000) == 47847

# Solution 2: Use an array (might be inefficient)

def find_fibonacci_index_by_length_v2(length)
  sequence = [1, 1]

  until sequence[-1].to_s.length >= length
    sequence << sequence[-1] + sequence[-2]
  end

  sequence.length
end

puts find_fibonacci_index_by_length_v2(2) == 7          # 1 1 2 3 5 8 13
puts find_fibonacci_index_by_length_v2(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
puts find_fibonacci_index_by_length_v2(10) == 45
puts find_fibonacci_index_by_length_v2(100) == 476
puts find_fibonacci_index_by_length_v2(1000) == 4782
puts find_fibonacci_index_by_length_v2(10000) == 47847