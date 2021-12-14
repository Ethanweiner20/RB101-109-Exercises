# Rotating Matrices

# PROBLEM

*Explicit Requirements*:
- **Input**: An mxn `matrix`
- **Output**: The 90 degree rotated version of `matrix`

*Implicit Requirements*:
- The output should also be an array of rows

*Edge Cases*:
- Empty matrix?
- One-element matrix?

*Questions*:
- Can the matrix contain non-integer values?

*Initial Ideas and Mental Models*:
- If too complex, start with a simpler matrix (3x3)
- Essentially like transposing, but the rows should be constructed in reverse


# EXAMPLES/TESTS

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

# DATA STRUCTURES



# ALGORITHM

Given a `matrix`:
- Initialize an empty `rotated_matrix`
- Retrieve all the columns from `matrix` as 1-d arrays**
- Append the reverse of each column to the `rotated_matrix`
- Return the `rotated_matrix`

*Clever Solution*: Transpose the matrix, & reverse the rows

*Sub-Problems*:




# CODE

*Implementation Details*: