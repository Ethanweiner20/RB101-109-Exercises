# Next Featured Number Higher than a Given Value

# PROBLEM

*Explicit Requirements*:
- **Input**: An integer `n`
- **Output**: The next featured # that is GREATER than `n`, or an error message (if there is no next featured #)
- **Rules**: A featured #:
  - Is an odd #
  - Is a multiple of 7
  - Each digit occurs exactly once

*Implicit Requirements*:
- 

*Edge Cases*:
- There is no next featured #...
  - Return an error message

*Questions*:
- How to know if there is no next featured #?
  - Once we've reached 10 digits, there must be no next featured # (PHP: at least one digit must repeat itself) -- i.e. check if the length of integer is 10
- Will the input always be non-negative? Yes

*Initial Ideas and Mental Models*:


# EXAMPLES/TESTS

featured(12) == 21
featured(20) == 21
featured(21) == 35
featured(997) == 1029
featured(1029) == 1043
featured(999_999) == 1_023_547
featured(999_999_987) == 1_023_456_987
featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

# DATA STRUCTURES

Input: Integer
Output: Integer or string (error message)

# ALGORITHM

# Solution 1: Simply increment by 1 until a featured # is found

# Solution 2 (efficient): Increment from the next candidate by 14

e.g.
n = 3
=> [find next odd multiple of 7] 7, 14, 21, 28
=> [remove even] 7, 21, ... (increment by 14)

Given a starting integer `n`:
- Assign `candidate` to the next odd multiple of `7` after n**
- While `n` has less than 11 digits:
  - If `candidate`'s digits are unique**, return that `candidate`
  - Increment `candidate` by 14
- Return an error (no featured # was found)
  - *Note*: If no featured # is found in the loop, there is no next featured # 

*Sub-Problems*:

## Determine the next odd multiple of 7

Given `n`:
- Increment `n` by 1 until:
  - n is divisible by 7 AND
  - n is odd

## Determine if a #'s digits are unique

Given a `number`:
- Remove the duplicates from `number` (#uniq)
- If the transformed version of `number` (without duplicates) is the same to the original, then the original # didn't contain duplicates => return true
- Otherwise, return false

# CODE

*Implementation Details*:
- Checking for digit uniqueness -- Use #uniq on the digits to see if any digits
are removed (b/c they are non-unique) -- digits.uniq == digits?