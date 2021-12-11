# Longest Sentence

# PROBLEM

*Explicit Requirements*:
- **Input**: A `text_file`
- **Output**: The longest sentence in the file
- Sentences are separated by periods (.), exclamation points (!) and question marks (?)
- Any other characters that are not spaces or sentence-ending characters should be treated as part of a word

*Questions*:
- Do new lines count as new sentences, even without ending punctuation? Assumption: No
- Should we return multiple sentences if there is more than one maximum?

*Implicit Requirements*:
- We need to read text files

*Edge Cases*:
- Dealing with new lines?
- If there is more than one maximum, just return the first occurrence

*Mental Models*:
1. Split the text into sentences => determine max by sentence length

# EXAMPLES/TESTS

Examples not included here

# DATA STRUCTURES

- We might use a File object to store the file
- We will use an array to contain the sentences

# ALGORITHM

Given the path to a `text_file`
- Open and copy the contents of `text_file` into a `string`
- Break the `string` into `sentences`
- Determine the longest sentence (by # of words)** in `sentences` (#max_by)
- Print the longest sentence and its length

*Sub-Problems*:

## Determine the # of words in a sentence

Given a `sentence`:
- Split the `sentence` by spaces
- Determine the length of the resulting array

# CODE

*Implementation Details*:
- File#open
- String#split, using a Regex pattern
- Array#max_by

# Further Exploration

When we split the sentences, we could write a custom split method that keeps the puncutation on which it splits.

In order to find the longest paragraph or word, we could simply split up our string along newlines (\n) or spaces (for words).