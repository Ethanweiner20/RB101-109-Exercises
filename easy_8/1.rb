# Solution 1: Follow the subsequence structure

def sum_of_sums(numbers)
  sum = 0
  numbers.each_index do |index|
    sum += numbers[0, index + 1].sum
  end
  sum
end

puts sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
puts sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
puts sum_of_sums([4]) == 4
puts sum_of_sums([1, 2, 3, 4, 5]) == 35

# Solution 2: Clever

# Use an accumulator to mimic subsequence summation

def sum_of_sums_v2(numbers)
  total_sum = 0
  accumulator = 0

  numbers.each do |number|
    accumulator += number
    total_sum += accumulator
  end

  total_sum
end

puts sum_of_sums_v2([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
puts sum_of_sums_v2([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
puts sum_of_sums_v2([4]) == 4
puts sum_of_sums_v2([1, 2, 3, 4, 5]) == 35

# Solution 3: Concise (use map)
# Map to subsequences, flatten all numbers, and sum