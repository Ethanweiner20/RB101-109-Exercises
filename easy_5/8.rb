# WORDS = [
#   "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine",
#   "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen",
#   "seventeen",  "eighteen", "nineteen"
# ]

# def alphabetic_number_sort(integers)
#   integers.sort { |integer1, integer2| WORDS[integer1] <=> WORDS[integer2] }
# end

# puts alphabetic_number_sort((0..19).to_a) == [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ]

# # Further Exploration

# =begin

# The problem requests that a NEW integers array is returned -- it doesn't ask for
# the original array to be mutated (as Array#sort_by!) would do. Technically, the
# solution could still be implemented with #sort_by!, but then the method
# `alphabetic_number_sort` would have 2 unrelated functions -- mutating the
# given array, and returning a new sorted array.

# =end

NUMBER_WORDS = %w(zero one two three four
  five six seven eight nine
  ten eleven twelve thirteen fourteen
  fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(numbers)
  numbers.sort_by! { |number| NUMBER_WORDS[number] }
end


puts alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]