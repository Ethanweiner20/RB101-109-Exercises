# Madlibs

=begin

Input: noun, verb, adjective, adverb
Output: A storgy

Data Structures:
- Hash? Best way to store the words...

=end

=begin

Example:

Enter a noun: dog
Enter a verb: walk
Enter an adjective: blue
Enter an adverb: quickly

Do you walk your blue dog quickly? That's hilarious!

=end

words = {}

print "Enter a noun: "
words[:noun] = gets.chomp
print "Enter a verb: "
words[:verb] = gets.chomp
print "Enter an adjective: "
words[:adjective] = gets.chomp
print "Enter an adverb: "
words[:adverb] = gets.chomp

puts "I will #{words[:verb]} you #{words[:adverb]} \
in exchange for a #{words[:adjective]} #{words[:noun]}. I promise."
