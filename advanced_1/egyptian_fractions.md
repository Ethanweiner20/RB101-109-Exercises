# Egyptian Fractions

# Rational -> Egyptian

# PROBLEM

*Explicit Requirements*:
- **Input**: A rational number (represented by the `Rational` class)
- **Output**: An array of the denominators of its Egyptian fraction representation
- **Egyptian Fraction**: A rational number represented as a sum of distinct *unit fractions* (numerator of 1)
- There are an infinite # of Egyptian fraction representations of a rational #,
so `egyptian` should just be able to find one possible representation

*Implicit Requirements*:
- An array of #s should be returned
- We might need to use functionality from the `Rational` class

*Edge Cases*:
- The rational # is 

*Questions*:
- Can the rational # be negative? 0
- Can the rational # be less than 0? No

*Initial Ideas and Mental Models*:
- Start with largest, work down
- Continue to add the next largest unit # until it exceeds the given #
- If you surpass it, just skip that unit #

e.g. 2/1 = 1/1 + 1/2 + 1/3 + 1/4X + 1/5X + 1/6

# EXAMPLES/TESTS

```ruby
egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
```

# DATA STRUCTURES

- Input: `Rational` number
- Output: Array of positive integers
- Intermediate:
  - Array to accumulate denominators
  - Unit number `sum` accumulator (optional)
    - Instead of computing the sum of all unit #s so far


# ALGORITHM

## Solution 1: Procedural

Given a `rational_number`:
- Initialize a `sum` to an empty rational #
- Initialize an empty array of `denominators`
- Initialize a `denominator` to 1
- Loop
  - Determine the `next_sum` of `sum` plus the unit number created with `denominator`**
  - If the `next_sum` is less than or equal to the `rational_number`:
    - Add the `denominator` to `denominators`
    - Reassign `sum` to `next_sum`
  - Increment the `denominator` by 1 (slightly smaller)
  - Break if the `sum` is equal to the `rational_number`
- Return the `denominators`

## Solution 2: Recursive

*Goal*: Return an array of denominators that form the `rational_number`

Given a `remaining_number` and current `denominator`:
- [Base case] If the `remaining_number` is zero, return an empty array
- [Recursive case]
  - If the unit number specified by the `denominator` is less than or equal to the `remaining_number`:
    - Prepend the `denominator` onto the rest of the `denominators`, and return
  - Otherwise, return the rest of the denominators
  

*Sub-Problems*:

## Determine the sum

Given a `rational_number` and a `denominator`:
- Create a `unit_number` (rational # w/ 1 as numerator) specified by the `demoninator`
- Sum the `rational_number` and the `unit_number`
- Return the new rational number

# CODE

*Implementation Details*:

- `Rational` class
  - Use the `Rational` constructor for creating unit #s: `Rational(1, _denominator_)`
  - `Rational#+` for summing
  - Comparing Rational #s: Use <=>