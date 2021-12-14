# Madlibs Revisited

# PROBLEM

*Explicit Requirements*:
- **Input**: A text file and some words to input
- **Output**: A printed version of the text, in which words from the input words of the appropriate types are randomly selected and placed into the text file

*Implicit Requirements*:
- The input text data should exactly match the output text data, just with the placeholders replaced
- **Each line will contain at most ONE of each word type**

*Edge Cases*:
- There aren't enough input words to fill all the placeholders
  - *Assumption*: There will always be enough input words for replacement

*Questions*:
- How to represent placeholders in text file? %{word_type}?
- Should we sample w/o replacement (i.e. should each word only be able to be used once?)
  - *Assumption*: No, you can use each word as many times as you want

*Initial Ideas and Mental Models*:
- Store words in a hash
- Iterate over the words, replacing (non-destructively) those that match a word type with a randomly selected input word from the hash
  - Sample w/o replacement by removing the word from the array
- Replace the words in the text file
  - Kernel#format (works directly on text)
  - String#gsub

# EXAMPLES/TESTS

Input Words: {
  adjective: %w(quick lazy sleepy ugly),
  noun: %w(fox dog head leg),
  verb: %w(jumps lifts bites licks),
  adverb: %w(easily lazily noisily excitedly)
}

Input Text Data:

The %{adjective} brown %{noun} %{adverb}
%{verb} the %{adjective} yellow
%{noun}, who %{adverb} %{verb} his
%{noun} and looks around.

# DATA STRUCTURES

Input: Text file
Intermediate:
- Strings (to read text file and to store the replacement text)

Ways to represent input words:
- A hash:
  - Key is word type
  - Value is a string
- **A hash**: 
  - Key is word type
  - Value is an array of strings
  - Good because random selection would be easier

# ALGORITHM

Options:
- Replace words, word-by-word
- Replace at once with some sort of data structure properly sorted for replacement
- 

## Solution 1: Word-by-word

Note: The hash's keys must be valid word types, and values must be arrays of words

Given the name of a `text_file` and a hash of the `replacement_words`:
- Read the text file into a string `text`
- Break the `text` into `words`
- Transform the `words`:
  - **Transformation Criteria** for a `word`:
    - If the `word` is a placeholder**:
      - Determine the `type` of the word, by extracting the word with the %{}
      - Randomly sample (w/o replacement) a `replacement_word` from `replacement_words`**
      - Return the `replacement_word`
    - Otherwise, just return the `word`
- Join the `words` back together with spaces & return

## Solution 2: Format all at once

Main Idea: Continually replace any words left until there are non left

Given the name of a `text_file` and a hash of the `replacement_words` 
- Read the text file into a string `text`
- Initialize a `staging_area` hash that contains 1 randomly selected word from each hash
- Keep creating `staging_areas` until all the words have been formatted

## Solution 3: Format line-by-line

Format each line:
- Create a staging area for each line
- Use the staging area to format that line
  - *Note*: This staging area (w/ one of each word type) will suffice for the entire line, because ach line can only contain at most one of each word type


*Sub-Problems*:

**Random sample w/o replacement from 


# CODE

*Implementation Details*:
- Kernel#format with 