# Word to Digit: Further Exploration

# PROBLEM

*Explicit Requirements*:
- **Input**: A `sentence` that might contain sequences of digits
- **Output**: The same string with any sequences of digits as words replaced with either:
  - The sequence of words converted to a sequence of digits, without spaces OR
  - If the digits can be converted to a phone #, format them as a phone #: "(123) 456-7890"

*Questions*:


*Implicit Requirements*:
- Spacing for digits already as numbers should not be affected.
- We must be able to deal with any instances of "." following numbers

*Assumptions*:
- "." is the only example of punctuation will we need to deal with

*Edge Cases*:
- Punctuation: Splitting and transforming the words is not enough. We must account for punctuation.


*Mental Models*:
1. Break up the sentence into manageable chunks. If the chunk is a sequence of digits, perform the necessary operation on it.
2. Construct a string while iterating over the words in the sentence.

# EXAMPLES/TESTS

puts word_to_digit('Please call me at five five five one two three four. Thanks.')
 #== 'Please call me at 5551234. Thanks.'
puts word_to_digit('Please call me at one two three four five six seven eight nine zero. Thanks.')
 #== 'Please call me at (123) 456-7890. Thanks.'
puts word_to_digit("I'm only 9 years old. Please call me at two two three! Thanks.")
 #== 'I'm only 9 years old. Please call me at 223! Thanks.'

# DATA STRUCTURES



# ALGORITHM

Given a `string`:
- Split the string into `sentences`, by splitting along any instances of a period plus a space
- For each sentence, convert any digit word sequences to digit number sequences
- Join the sentence back together with a period
- Return the final string

*Sub-Problems*:

## Convert digit word sequences in a sentence (without punctuation) to digit numbers

Given a `sentence`:
- Initialize a `result_words` to an empty array
- Initialize a `digits_sequence` to an empty array
- Split the `sentence` into words and iterate over the words:
  - If the `word` matches any of the digit keys:
    - Add the associated digit (as a #) to the `digits_sequence`
  - Otherwise:
    - If the sequence contains elements (has length), collapse it into a singular string**
    - Append the collapsed digits to `result_words`
    - Add `word` to the `result_words`
- Return the joined `result_words` (joined by spaces)

## Collapse a digits sequence into a singular string

Given a list of `digits`:
- If the sequence has a length of 10:
  - Format as a phone #
- Otherwise, join the sequence (w/o spaces) and add it to the `result_words`

# CODE

*Implementation Details*: