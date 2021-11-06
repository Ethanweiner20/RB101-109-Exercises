# Greeting a user

# PROBLEM

=begin

Write a program that will ask for user's name. The program will then greet the user. If the user writes "name!" then the computer yells back to the user.

Inputs:
- _name_ of user

Outputs:
- Print a greeting

Assumptions:
- The computer yells at the user if and only if the ! is at the end of the string

=end

# EXAMPLES/TESTS

=begin

What is your name? Bob
Hello Bob.

What is your name? Bob!
HELLO BOB. WHY ARE WE SCREAMING?

=end

# Solution 1

def greeting(name)
  return "HELLO #{name.upcase.delete_suffix('!')}. WHY ARE WE SCREAMING?" if name =~ /!$/
  "Hello #{name}."
end

print "What is your name? "
name = gets.chomp.strip

puts greeting(name)

# Solution 2 (Better)

# Take care of two actions at once:
# - Check if `name` ends with "!"
# - If so, delete the "!" so we don't print it

def greeting_v2(name)
  return "HELLO #{name.upcase}. WHY ARE WE SCREAMING?" if name.delete_suffix!("!")
  "Hello #{name}."
end

print "What is your name? "
name = gets.chomp.strip

puts greeting_v2(name)

# Why does it work? Because #delete_suffix! returns nil if the suffix couldn't be found

# Further Exploration

print 'What is your name? '
name = gets
name.chomp!

if name[-1] == '!'
  name.chop!
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end
