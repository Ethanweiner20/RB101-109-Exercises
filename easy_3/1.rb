# PROBLEM
# ============================================================================

=begin

Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th number appears amongst the first 5 numbers.

Inputs:
- 6 numbers

Output:
- Boolean message (does 6th # appear amongst 1st 5?)

Mental Model: Accumulate the first 5 numbers in an _array_, and accumulate the final number in a separate variable. Search the array for that number.

Assumptions:
- The #include method is allowed
- The numbers must be non-negative integers (input validation is required)
- Duplicatre numbers can appear in the array.

=end

# EXAMPLES/TESTS
# ============================================================================

=begin

==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
17
The number 17 appears in [25, 15, 20, 17, 23].

==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
18
The number 18 does not appear in [25, 15, 20, 17, 23].

=end

# DATA STRUCTURE: We will use an array to accumulate the first 5 numbers. The last number will be stored in a separate variable.

# ALGORITHM
# ============================================================================

=begin

numbers_to_search = []

Loop with index
  Prompt user
  number = SUBPROCESS retrieve_number
  numbers_to_search << number

Set number_to_find = retrieve a final # from user
Set number_found = numbers to search includes number

Print conditionally based on `number_found`

SUBPROCESS retrieve_number
  loop
    input number from user
    validate # as non-negative
    break from loop if validated
    print otherwise

=end

# CODE
# ============================================================================

ORDINALS = %w(1st 2nd 3rd 4th 5th)

def prompt(message)
  puts "==> #{message}"
end

# Retrieve a number from the user until a valid number is retrieved
def retrieve_number
  number_input = ''
  loop do
    number_input = gets.chomp
    break if valid_number?(number_input)
    puts "Invalid number. Please enter a non-negative integer:"
  end
  number_input.to_i
end

# Is _input_ a non-negative integer?
def valid_number?(input)
  input.to_i.to_s == input && input.to_i >= 0
end

numbers_to_search = []

# Retrieve first 5 numbers
ORDINALS.each do |ordinal|
  prompt("Enter the #{ordinal} number:")
  numbers_to_search << retrieve_number()
end

# Retrieve final number separately
prompt("Enter the last number:")
number_to_find = retrieve_number()

puts "The number #{number_to_find} #{numbers_to_search.include?(number_to_find) ? 'appears' : 'does not appear'} in #{numbers_to_search}."
