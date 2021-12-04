def swap(string)
  words = string.split(' ')
  words.map { |word| swap_word(word) }.join(' ')
end

# puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# puts swap('Abcde') == 'ebcdA'
# puts swap('a') == 'a'

def swap_word(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap_word_v2(word)
  first_character = word[0] # Object ID: X
  last_character = word[word.length - 1] # Object ID: Y
  word[0] = last_character # OBJECT ID: Y
  word[word.length - 1] = first_character # OBJECT ID: X
  word
end

# Note: The swap occurs correctly because of the way that variables point to
# objects in Ruby

# puts swap_word('a') == 'a'
# puts swap_word('abc') #== 'cba'

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'

# def swap(string)
#   words = string.split(' ')
#   words.each { |word| swap_first_last_characters(word[0], word[-1]) }
#   words.join(' ')
# end

# def swap_first_last_characters(first, last)
#   p first.object_id
#   p last.object_id
# end

# word = "ethan"
# ethan = word

# # PROBLEM: [] only returns a substring -- it is not directly element access
# # Array[]=, on the other hand, IS direct element access

# p word[0].object_id
# p word[1].object_id
# word[0].gsub!("e", "h")

# p word
# p ethan

# p ethan[0].object_id
# p ethan[1].object_id

# puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# puts swap('Abcde') == 'ebcdA'
# puts swap('a') == 'a'

# NOTE

=begin

AVOID MAKING ASSUMPTIONS (when learning a new language)

- Discuss how this relates to mastery
- Discuss how EVEN IF you have prior experience, you must still have a 
"beginner's mind", because the journey to mastery is endless.
- This applies to more than just programming too . . .
- Of course, have clarity on what you know. But recognize that there are
many things you might not know.

- Describe how Position/Clarity/Flexibility applies to this all?
My position: Arrays and strings have similar value
Clarity: I had practiced in previous languages and understood it
Flexibility (this is where I lacked a bit): I was willing to question
my previous assumptions and test it on IRB

=end

=begin

Element access in Strings is different from arrays.

[Do some tests with object ID's instead]

e.g. word[3] = word[3].gsub('a', 'b') # This will result in replacement

- Array#[] returns the element its accessed directly
- Array#[]= allows for direct mutation of the string

array = ['a', 'b', 'c']
array[2].gsub!('c', 'b') # This DOES directly replace


- String#[] returns a copy of the substring
- String#[]=, on the other hand, allows for direct mutation of the string
(direct replacement of characters)

e.g. word[3] = 'b' # This directly replaces it
e.g. word[3].gsub!('a', 'b') # This is actually 
I thought this method was mutation! Shouldn't it be mutating the object
directly stored at word[3]?

This is where the confusion comes in. word[3] is not accessing that character
directly.

Where I went wrong: I made the assumption that Strings and Arrays behave
the same way. Even though they are both collections, they have very
different behaviors.

Major note:
- If you look at a low level language at C, there's often this notion that
Strings are arrays
- And while the problem-sovling fundamentals might extrapolate across languages,
it is wise not to assume that nuances like this carry over 



Long-story short: read the docs, and don't assume all languages are the same.

=end