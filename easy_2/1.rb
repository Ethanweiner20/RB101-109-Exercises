# How old is Teddy?

# PROBLEM

=begin

Build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random number between 20 and 200. 

Questions:
- Is the range for Teddy's age inclusive (i.e. can Teddy be 20 or 200)?

Assumptions:
- The range for Teddy's age is inclusive

Mental Model:
- Create a method that generates a random age
- Use that method to print

=end

def random_age
  rand(20..200)
end

puts "Teddy is #{random_age()} years old!"

# Practice disabling Rubocop

# rubocop:disable Style/RandomWithOffset
def random_age_v2
  rand(181) + 20 # [0, 181) + 20 = [20, 201) = [20, 200] (as integers)
end
# rubocop:enable Style/RandomWithOffset

puts "Teddy is #{random_age_v2()} years old!"

# Further Exploration

def prompt(message)
  puts "==> #{message}"
end

def print_age(name)
  prompt("#{name.empty? ? 'Teddy' : name } is #{random_age} years old!")
end

prompt("What is your name?")
name = gets.chomp.strip # #strip ensures that name.empty? is true when name == " "

print_age(name)
