# Word to Digit

DIGITS = {
  "zero" => '0',
  "one" => '1',
  "two" => '2',
  "three" => '3',
  "four" => '4',
  "five" => '5',
  "six" => '6',
  "seven" => '7',
  "eight" => '8',
  "nine" => '9'
}

# Solution 1: Basic

# Doesn't work properly -- doesn't include numbers susrrounded by punctuation

def word_to_digit_v1(sentence)
  sentence.split
          .map { |word| DIGITS.keys.include?(word) ? DIGITS[word] : word }
          .join(' ')
end


# Solution 2: Simple

# \b flag ensures that only the EXACT words are matched -- not phrases/words
# containing the word

def word_to_digit_v2(sentence)
  DIGITS.each { |word, number| sentence.gsub!(/\b#{word}\b/, number) }
  sentence
end

# Further Exploration

# Replace all sequences of digits as words with digits as numbers, spaces removeds

# Idea: 

# def word_to_digit(sentence)
#   result_words = []
#   digits_sequence = []

#   sentence.split.each do |word|
#     if DIGITS.keys.any? { |digit| word =~ /\b#{digit}\b/ }
#       digits_sequence << word
#     else
#       if digits_sequence.length > 0
#         result_words << collapse(digits_sequence)
#         digits_sequence = []
#       end
#       result_words << word
#     end
#   end

#   result_words << collapse(digits_sequence)
#   result_words.join(' ')
# end

# def collapse(digits_sequence)
#   digits = digits_sequence.map do |element|
#     element.sub(\b\b)
#     DIGITS.each { |word, number| element.sub(/\b#{word}\b/, number) }
#   end

#   digits.length == 10 ? phone_number(digits) : digits.join
# end

# Assumption: Digits has a length of 10
def phone_number(digits)
  "(#{digits[0..2].join}) #{digits[3..5].join}-#{digits[6..9].join}"
end


# Idea

# Split any sentences w/ punctuation

def word_to_digit(sentence)
  chunks = sentence.split(/\.!/)
  
end


puts word_to_digit('Please call me at five five five one two three four. Thanks.')
 #== 'Please call me at 5551234. Thanks.'
puts word_to_digit('Please call me at one two three four five six seven eight nine zero. Thanks.')
 #== 'Please call me at (123) 456-7890. Thanks.'
puts word_to_digit("I'm only 9 years old. Please call me at two two three! Thanks.")
 #== 'I'm only 9 years old. Please call me at 223! Thanks.'
