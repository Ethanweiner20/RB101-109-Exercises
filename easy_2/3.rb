# Tip calculator

# PROBLEM

=begin

Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The proogram must compute the tip and then display both the tip and the total amount of the bill.

Input:
- The _bill_amount_ (float)
- The _tip_rate_ (float)

Output:
- Tip
- Total

Assumptions:
- The inputs can be floats
- Validation is necessary
- The bill & tip percentage must be positive

Mental Model: Create a method for computing the tip

=end

# EXAMPLE/TESTS

=begin

What is the bill? 200
What is the tip percentage? 15

The tip is $30.0
The total is $230.0

=end

# DATA STRUCTURE:

=begin

I could use a hash to store the tip amount total bill amount
Example:
{
  tip: 30.0,
  total: 230.0
}

I'm going to avoid this solution though. I think this sacrifices a clear return value.

=end

# ALGORITHM

=begin

Retrieve inputs

SUBPROCESS bill_details
- Given _bill_amount_ & _tip_rate_
- Compute the tip by multiplying _bill_amount_ by _tip_rate_ / 100
- Compute the total by adding _tip_ to _bill_amount_

Print the value of bill_details by accessing the key.

Idea: Start a discussion in the solution section. Do you guys think the provided solution is better? I like the fact that `bill_details` computes everything at once, but I think that the return values of the methods in the proivded solution are clearer. Without proper documentation, bill_details feels a bit shaky. What are your thoughts?

=end

def bill_details(bill_amount, tip_rate)
  details = {}
  details[:tip] = (bill_amount * (tip_rate / 100))
  details[:total] = (bill_amount + details[:tip])
  details
end

def positive_number?(input)
  (input.to_f.to_s == input || input.to_i.to_s == input) && input.to_f.positive?
end

bill_amount_input = ''

loop do
  print "What is the bill? "
  bill_amount_input = gets.chomp
  break if positive_number?(bill_amount_input) # Validation
  puts "Please enter a positive number."
end

tip_rate_input = ''

loop do
  print "What is the tip percentage? "
  tip_rate_input = gets.chomp
  break if positive_number?(tip_rate_input) # Validation
  puts "Please enter a positive number."
end

bill_details = bill_details(bill_amount_input.to_f, tip_rate_input.to_f)

puts "The tip is $#{format("%.2f", bill_details[:tip])}"
puts "The total is $#{format("%.2f", bill_details[:total])}"
