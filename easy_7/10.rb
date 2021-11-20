# The End is Near But Not Hear

# Solution 1: Easy (negative indexing)

def penultimate(string)
  string.split[-2]
end

puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'

# Solution 2: Regular indexing

def penultimate_v2(string)
  words = string.split
  words.each_with_index do |word, index|
    return word if index == words.length - 2
  end
end

puts penultimate_v2('last word') == 'last'
puts penultimate_v2('Launch School is great!') == 'is'

# Further Exploration

=begin

Problem: Retrieve the middle word of a phrase/sentence

Edge Cases:
- The string contains an even # of words
  - Potential solution: Return the word directly to the left of what would be
  - Potential solution: Return the 2 middle words
  the middle
- String contains 0 words
  - Potential solution: Return an empty string


Middle Index Test:
- Word Length: 0 => error
- 1 => 0
- 2 => 0
- 3 => 1
- 4 => 1

Pattern: (word length - 1) / 2

=end

def middle_word(string)
  words = string.split
  return '' if words.empty? 
  middle_index = (words.length - 1) / 2
  words[middle_index]
end

puts middle_word("")
puts middle_word("Ethan")
puts middle_word("Ethan is")
puts middle_word("Ethan is cooler")
puts middle_word("Ethan is cooler than")
puts middle_word("Ethan is cooler than you")