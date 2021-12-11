# PROBLEM

*Explicit Requirements*:
- **Input**: A `string`
- **Output**: A boolean value indicating whether `string` can be "built" using the spelling block
- *Rule*: A string can be "built" using a spelling block if it can be built by using each block only once. Both letters from the block can not be used.

*Questions*:
- Can the input string contain non-alphabetic characters? Can blocks?
- Do we only need to account for the given set of blocks?
- Can there be duplicate blocks?

*Assumptions*:
- We are only dealing w/ non-alphabetic characters
- If there are duplicate blocks, only remove one of them
- The blocks will only contain uppercase letters

*Implicit Requirements*:
- The algorithm should be case-sensitive (a block letter's case doesn't' need to match the case of a letter in the input string for it to be used)
- The spelling blocks contain all 26 letters

*Edge Cases*:
- The case of the input string is different from the case of the letter block
  - Should still be able to use the letter in the block


*Mental Models*:
1. "Check off" each block once it's been used
  - Did this by deleting the blocks

# EXAMPLES/TESTS

block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true

# DATA STRUCTURES

Input: String
Output: Boolean
Blocks: Nested array of 2-element arrays
- Each 2-element array is a block
- Whether a block is in the 2-element array indicates whether it can be used

# ALGORITHM

# Solution 1

Initialize a `BLOCKS` constant of the spelling blocks

Given a `string` to spell:
- Copy the blocks from `BLOCKS` into a new `blocks` 2-d array
- Check if every `character` in `string` can be spelled using `blocks`**:
  - Check if each `character` can be spelling using the remaining `blocks`
- If so, return true
- Otherwise, return false

# Solution 2

*Presumption*: All 26 letters will be included in the given blocks, and we are only dealing with letters

We know that we can spell every letter with at least one block.

So we simply need to make sure that no block is used more than once. This ensures that we use only one letter from each block.


*Sub-Problems*:

## Check if a character in string can be spelling using the remaining blocks

Given a `character` and the remaining `blocks`
- Try to find a remaining `block` that can be used to spell that `character`**
- Retrieve the `index` of that `block` (#find_index)
- If a `block`/`index` is found:
  - Remove the block from `blocks` at `index`
  - Return true
- Otherwise, if no block is found, return false

## Check if a character can be spelled with a block
Given a `character` and a `block`
- If the lowercase or uppercase of the character of the character (case-sensitive) is included in the `block`, then return true
- Otherwise, return false

# CODE

*Implementation Details*:
- Use #find_index to be able to more easily delete the block?
- #delete will return the found object if one is found, otherwise, it will return nil