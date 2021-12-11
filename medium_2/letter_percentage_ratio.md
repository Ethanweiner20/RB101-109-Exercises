# Letter Percentage Ratio

# PROBLEM

*Explicit Requirements*:
- **Input**: A `string` of any characters
  - The string will have at least one character
- **Output**: A hash providing the percentage of lowercase, uppercase, & non-letter characters

*Questions*:
- Should spaces be included as a "neither" character? Yes

*Implicit Requirements*:
- All percentages should be formatted with one decimal place
- The hash should contain all three keys (lowercase, uppercase, and neither), even if the associated percentage is 0
- The keys of the hash should be symbols
- The values of the hash should be 1-decimal formatted floats

*Edge Cases*:
- At least one of the categories contains 0 of the character type => Should be included in the hash w/ a 0.0 percentage

*Mental Models*:
1. Accumulate a hash w/ the letter counts, and transform to percentages (using the string length)
2. Accumulate the individual counts, divide each count by the string length, and add results to a hash

# EXAMPLES/TESTS

letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

# DATA STRUCTURES

Input: String
Output: Hash
Intermediate: Hash to accumulate counts?

# ALGORITHM

# Solution 1

Given a `string`:
- Initialize a hash w/ 3 keys (lowercase, uppercase, neither) all set to 0
- For each `character` in `string`:
  - Add 1 to the key that describes the `character`**
- Transform the values in hash:
  - Divide each count by the entire string length
    - Convert the count to a float to ensure 
  - Convert the result to a float (in case its an integer)
  - Round the float to 1 decimal palace
- Return the transformed hash

*Sub-Problems*:

## Deterermine if a character is lowercase, uppercase, or neither

- If the character is lowercase (use regex)j, return :lowercase
- If the character is lowercase (use regex)j, return :uppercase
- If the character is lowercase (use regex)j, return :neither

# Solution 2

Increment by percentages, not counts ==> no need for conversion

# CODE

*Implementation Details*:
- We can use the returned symbol to directly index into the hash for incrementation
- Method that can round to the decimal place + preserve decimal place
- #transform_values for transformation
