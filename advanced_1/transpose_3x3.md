# Transpose 3x3

# PROBLEM

*Explicit Requirements*:
- **Input**: A 3x3 `matrix`, represented by an array of 3 rows, each of which has 3 numbers
- **Output**: A **new** matrix that is the result of transposing the original `matrix`
  - **Transpose**: Previous rows become columns, previous columns become rows
- `matrix` must not be mutated
- A new array must be returned

*Implicit Requirements*:


*Edge Cases*:


*Questions*:
- Can the matrix contain non-integer elements?

*Initial Ideas and Mental Models*:
- We only need to switch the rows OR the columns, we don't need to do both
- For each row, append the element at row index to the array at row index?
- Clarified:
  - Initialize a set of empty rows
  - Iterate through each row, tracking the element & its "index"
  - Add the element to the "index"th row

# EXAMPLES/TESTS

```ruby
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

Initial Rows:
[] => [1] => [1, 4]
[] => [5]
[] => [8]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
```

# DATA STRUCTURES

- Input: 2-d array of rows
- Output: 2-d array of rows
- Intermediate: 2-d array of rows to accumulate result

# ALGORITHM

Given a `matrix`:
- Initialize a `transposed_matrix` to an array of 3 empty rows
- For each `row` in `matrix`:
  - For each `element` and `index` in a `row`:
    - Add the element to the `index`th row in `transposed_matrix`
- Return the `transposed_matrix`

*Sub-Problems*:


# CODE

*Implementation Details*:
- Do not use Array.new for rows; will result in rows pointing to the same object

# Further Exploration

## Transpose matrix in place

*Note*: Don't simply copy the results from `transpose` into the argument array

*High-Level Idea*: Directly swap elements
- Instead of creating new rows, simply swapping each jth element in the ith row for the jth element in the ith column will work
  - Problem: Can only swap once
  - Solution: Iterate one less each time
- e.g. Swap 2nd element in 1st row for 2nd element in 2nd column

Given a `matrix`:
- Iterate from 0 to 2, tracking the `column_index`
  - Iterate from 0 to `column_index`, tracking the `row_index`
    - Swap the element at matrix[row_index][col_index] for the element at matrix[col_index][row_index]

*This effectively swaps only one half of the matrix, avoiding the problem fo double swapping*