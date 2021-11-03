# Reverse It (Part 1)

# PROBLEM

=begin

Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

Input:
- A _string_ to be "reversed"

Output:
- A string that is a version of _string_ with the word order reversed

Clarifications;
- We aren't reversing the entire string, we are simply reversing the word order
- The "split" method will automatically filter out any spaces...

Assumptions:
- A word is a sequence of any characters not separated by a space

Mental Model: Store words in a collection and reverse that collection, by iterating over the collection backwards, and storing the words in a new collection. Join the strings in that collection.

Mental model 2: Store words in a collection and iterate from end to beginning, appending a new string with the word + " "

=end



# DATA STRUCTURE: We will use an array to store our words (in initial order). We will use a separate array to store the words in separate order. Or, we use the same array, and perform a "swapping"...

# ALGORITHM

=begin

Informal:

Given a sentence:

Split the sentence into its individual words
Initialize a reversed array
Initialize an index variable to 0

Iterate from the end of words to the beginning of words
- Add the current word to the reversed array at index
- Decrement index by 1

Join the words in the reversed array w/ a space
Return the reversed array


Formal:

START

# Given a string called "sentence"

SET words = SUBPROCESS split sentence with " "
SET reversed_words = empty collection
SET index = words.length - 1

WHILE index >= 0
  reversed_words << words[index]
  index -= 1

# Search documentation
RETURN SUBPROCESS join reversed_words, separating by a " " 

END

=end

# CODE

# Mental Model 1

def reverse_sentence(sentence)
  words = sentence.split
  reversed_words = []
  index = words.length - 1

  while index >= 0
    reversed_words << words[index]
    index -= 1
  end

  return reversed_words.join(" ")
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''
puts reverse_sentence('Hello') == 'Hello'
puts reverse_sentence('Hello') == 'Hello'
puts reverse_sentence('Hello World    ') == 'World Hello'
puts reverse_sentence('Hello, World!') == 'World! Hello,'

def reverse_sentence(sentence)
  reversed_words = []
  sentence.split.reverse.each { |word| reversed_words << word }
  return reversed_words.join(" ")
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''
puts reverse_sentence('Hello') == 'Hello'
puts reverse_sentence('Hello') == 'Hello'
puts reverse_sentence('Hello World    ') == 'World Hello'
puts reverse_sentence('Hello, World!') == 'World! Hello,'

# Mental Model 2

def reverse_sentence(sentence)
  words = sentence.split
  reversed_string = ""
  index = words.length - 1

  while index >= 0
    reversed_string << words[index]
    reversed_string << " " unless index == 0
    index -= 1
  end

  return reversed_string
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''
puts reverse_sentence('Hello') == 'Hello'
puts reverse_sentence('Hello') == 'Hello'
puts reverse_sentence('Hello World    ') == 'World Hello'
puts reverse_sentence('Hello, World!') == 'World! Hello,'