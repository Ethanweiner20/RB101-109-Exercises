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

SENTENCE_DELIMITER = '. '

def word_to_digit(string)
  sentences = string.split(SENTENCE_DELIMITER)
  sentences.map { |sentence| convert_digit_sequences(sentence) }
           .join(SENTENCE_DELIMITER)
end

def convert_digit_sequences(sentence)
  result_words = []
  digits_sequence = []

  sentence.split.each do |word|
    if DIGITS[word.downcase]
      digits_sequence << DIGITS[word.downcase]
    else
      if digits_sequence.length > 0
        result_words << collapse(digits_sequence)
        digits_sequence = []
      end
      result_words << word
    end
  end

  result_words << collapse(digits_sequence) if digits_sequence.length > 0
  result_words.join(' ')
end

def collapse(digits)
  digits.length == 10 ? phone_number(digits) : digits.join 
end

def phone_number(digits)
  "(#{digits[0..2].join}) #{digits[3..5].join}-#{digits[6..9].join}"
end

puts word_to_digit('Please call me at five five five one two three four. Thanks.')
 #== 'Please call me at 5551234. Thanks.'
puts word_to_digit('Please call me at one two three four five six seven eight nine zero. Thanks.')
 #== 'Please call me at (123) 456-7890. Thanks.'
puts word_to_digit("I'm only 9 years old. Please call me at two two three. Thanks.")
 #== 'I'm only 9 years old. Please call me at 223! Thanks.'