# What's my Bonus?

# PROBLEM

=begin

Write a method that takes two arguments, a positive integer and a boolean, and calculates the bonus for a given salary. If the boolean is true, the bonus should be half of the salary. If the boolean is false, the bonus should be 0.

Input:
- A positive integer _salary_
- A boolean _gets_bonus_

Output:
- A non-negative integer, representing the bonus for the given salary

Mental Model: Use conditional logic to calculate the bonus

Questions:
- Can the bonus be a non-whole number? No (according to examples)

=end

def calculate_bonus(salary, gets_bonus)
  gets_bonus ? salary / 2 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
