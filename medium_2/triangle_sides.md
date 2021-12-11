# Triangle Sides

# PROBLEM

*Explicit Requirements*:
- **Input**: 3 side lengths as positive integers, `side1`, `side2`, `side3`
- **Output**: A symbol that indicates the type of triangle based on the side lengths
  - :equilateral
  - :isosceles
  - :scalene
  - :invalid

*Questions*:
- Could I receive a negative side length? No
- Could I receive a string as a side length? No

*Implicit Requirements*:
- We should be able to deal with non-whole side lengths (floats)

*Edge Cases*:
- A 0 is a side length

*Mental Models*:
1. Eplicitly lay out all the conditions that produce each different triangle type (and invalid triangles)

# EXAMPLES/TESTS

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

# DATA STRUCTURES

Array possibly, most likely nothing needed

# ALGORITHM

## Solution 1

Given three side lengths, `side1`, `side2`, and `side3`:
- If the triangle produced by the side lengths is invalid**, return :invalid
- If the triangle is an equilateral triangle**, return :equilateral
- If the triangle is an isosceles triangle**, return :isosceles
- Otherwise, return :scalene

*Sub-Problems*:

## Check if the side lengths are invalid

### Solution 1

Given `side1`, `side2`, and `side3`:
- Check if any of the sides are less than or equal to zero
  - If so, return true
- Check if any side length is greater than or equal to the sum of the other 2 sides***
  - If so, return true
- If neither of these conditions are met, return false

### Solution 2


## Check if any side length is greater than or equal to the sum of the other 2 sides

Given `side1`, `side2`, and `side3`:
- Store the sides in an array called `sides`
- Sort the sides by the length and remove it from the array, storing in `longest_side` (#pop)
- Return true if that longest side is less than the sum of the other 2 sides in `sides`

## Check if the triangle is an equilateral triangle

Given `side1`, `side2`, and `side3`:
- Return true if:
  - Side1 equals side2 AND
  - Side2 equals side3
- Otherwise, return false

## Check if the triangle is an isosceles triangle:

Given `side1`, `side2`, and `side3`:
- Return true if:
  - Side1 equals side2 OR
  - Side2 equals side3 OR
  - Side1 equals side3
- Otherwise return false

# CODE

*Implementation Details*:
- side1 == side2 == side3 (doesn't work)
