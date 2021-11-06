# When will I retire?

# PROBLEM

=begin

Build a program that displays when the user will retire and how many years she has to work till retirement.

Inputs:
- _age_
- _retirement_age_

Outputs:
- Print # of years left until retirement
- Print Year of retirement

Requirements:
- Time class/module

Assumptions:
- Ages must be whole integers
- Input validation is not required

=end

# EXAMPLES/TESTS

=begin

What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!

=end

# ALGORITHM

=begin

Retrieve _age_ and _retirement_age_
Set `years_until_retirement` = retirement_age - age
Set `retirement_year` = SUBPROCESS get current year + `years_until_retirement`
Print the results

=end

# CODE

print "What is your age? "
age = gets.chomp.to_i

print "At what age would you like to retire? "
retirement_age = gets.chomp.to_i

years_until_retirement = retirement_age - age
current_year = Time.now.year
retirement_year = current_year + years_until_retirement

puts "It's #{current_year}. You willl retire in #{retirement_year}. You only have #{years_until_retirement} years of work to go!"
