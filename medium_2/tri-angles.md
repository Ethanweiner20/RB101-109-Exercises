# Tri-Angles

# PROBLEM

*Explicit Requirements*:
- **Input**: 3 angles of a triangle, `angle1`, `angle2`, and `angle3`
  - The angles will be integer values in degrees
- **Output**: A symbol specifying the type of triangle: :right, :acute, :obtuse, :invalid
- *Rules*:
  - A triangle is valid if the sum of its angles are exactly 180 degrees & all angles are greater than zero
  - A triangle is a right triangle if one angle is 90
  - A triangle is an obtuse triangle if one angle is greater than 90
  - A triangle is an acute triangle if all angles are less than 90

*Implicit Requirements*:
- The inputs are passed as 3 separate arguments, not an array

*Edge Cases*:
- Invalid triangles

*Questions*:
- Can the input include negative angles?

*Initial Ideas and Mental Models*:


# EXAMPLES/TESTS

triangle(60, 70, 50) == :acute
triangle(30, 90, 60) == :right
triangle(120, 50, 10) == :obtuse
triangle(0, 90, 90) == :invalid
triangle(50, 50, 50) == :invalid

# DATA STRUCTURES

We will use an array to store the angles

# ALGORITHM

Given three angles:
- Store the `angles` in an array
- If the angles form an invalid triangle**, return :invalid
- Otherwise, if one of the angles is 90 degrees, return :right
- Otherwise, if one of the angles is >90 degrees, return :obtuse
- Otherwise, return :acute

*Sub-Problems*:

## Determine if the angles are valid

Given three `angles`:
- Are all angles greater than zero and the sum of the angles equal to 180?


# CODE

*Implementation Details*: