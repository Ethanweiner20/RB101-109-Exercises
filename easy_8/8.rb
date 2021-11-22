# Double Char (Part 2)

=begin

Only double characters if it is a consonant.

Sub-Problem: Determine whether a character is a cononant...
Possible solution:
- Is the character a letter AND is the character NOT a vowel?

I use map, because I view this as a character transformation.

=end

def double_consonants(string)
  string.chars.map { |char| consonant?(char) ? char * 2 : char }.join
end

def consonant?(character)
  !!(character =~ /[a-z]/i && character =~ /[^aeiou]/i)
end

# puts consonant?('a') == false
# puts consonant?('A') == false
# puts consonant?('b') == true
# puts consonant?('B') == true
# puts consonant?('-') == false

puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""
