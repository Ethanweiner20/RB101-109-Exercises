# Matching Parentheses?

# PROBLEM

*Explicit Requirements*:
- **Input**: A `string`
- **Output**: A Boolean that describes whether `string` is properly balanced w/ parentheses
- **Rule**: To be properly balanced, parentheses must occur in matching '(' and ')' pairs

*Implicit Requirements*:
- A string with no parentheses is considered balanced
- The input string can contain non-alphabetic characters

*Questions*:
- Can pairs be parentheses that are directly next to one another?
  - Assumption: Yes

*Edge Cases*:
- A string with no parentheses: Return true
- Empty string: Return true
- The string contains the same # of left & right parens, but the right parens exceed the left parens first

*Initial Ideas and Mental Models*:
- It's not as simple as just making sure the counts of each paren are equal
- Every left paren should have a matching right paren
- Idea:
  - Build a "stack" of parens, where left parens pop onto stack, and right parens
  pop off of stack
- Idea:
  - Increment a #
  - Increment # on left parens
  - Decrement # on right parens
  - If at any point the # becomes negative, then we have too many right parens
  - If the end ends at 0, the parens are balanced

# EXAMPLES/TESTS

balanced?('What (is) this?') == true
balanced?('What is) this?') == false
balanced?('What (is this?') == false
balanced?('((What) (is this))?') == true
balanced?('((What)) (is this))?') == false
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false

# DATA STRUCTURES

- Input: String
- Output: Boolean

# ALGORITHM

# Solution 1: Tracking the state w/ an integer

Given a `string` that might have parentheses:
- Initialize a `paren_state` to 0
- Iterate over each `character` in `string`:
  - If `character` is a left paren, increment `paren_state`
  - If `character` is a right paren, decrement `paren_state`
  - If `paren_state` is negative, return `false`
    - *Note*: Left parens were balanced too early
- If `paren_state` is 0, return true (all parens were balanced)
- Otherwise, return false

# Solution 2: Tracking the state w/ a stack

Given a `string` that might have parentheses:
- Initialize a `paren_stack` to an empty array
- Iterate over each `character` in `string`:
  - Add any left paren's to the stack (#push)
  - Whenever we come across a right paren, remove the top left paren from the stack (#pop)
    - If we try to remove, and the array is empty, then return false (right parens exceeded the left parens)
- If the stack is empty once we finish, return true

*Sub-Problems*:




# CODE

*Implementation Details*:

# Further Exploration

Given a `string`:
- Initialize a `PAIRS` constant that is a hash where each key-value pair is a pair
  - Each key contains the left side of the pair
  - Each value contains the right side of the pair
  - Parens, brackets, quotations
- Initialize an empty stack `balance_stack`
- Iterate over each `character`:
  - If the `character` is any of the keys in `PAIRS`:
    - Push it to the `balance_stack`
  - If the `character` is any of the values in `PAIRS`:
    - Denote the key-value pair that was found
    - Pop the last value from the `balance_stack`
    - The popped value must be the *key* from that key value pair
      - If it's not, then the match won't be working properly => Return false
- If the stack ends up as empty, all pairs are balanced, so return true
- Otherwise return false

## Including single & double quotes

Given a `string`:
- Initialize a `PAIRS` constant that is a hash where each key-value pair is a pair
  - Each key contains the left side of the pair
  - Each value contains the right side of the pair
  - Parens, brackets, quotations
- Initialize an empty stack `balance_stack`
- Iterate over each `character`:
  - If the `character` is 
  - If the `character` is any of the keys in `PAIRS`:
    - Push it to the `balance_stack`
  - If the `character` is any of the values in `PAIRS`:
    - Denote the key-value pair that was found
    - Pop the last value from the `balance_stack`
    - The popped value must be the *key* from that key value pair
      - If it's not, then the match won't be working properly => Return false
- If the stack ends up as empty, all pairs are balanced, so return true
- Otherwise return false