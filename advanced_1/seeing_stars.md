# Seeing Stars

# PROBLEM

*Explicit Requirements*:
- **Input**: An odd integer `n` that rperesents the grid size
- **Output**: An 8-pointed star displayed on an `n`x`n` grid
- The smallest star we must handle is a 7x7 grid

*Implicit Requirements*:
- The characters used to draw the star should be '*'

*Edge Cases*:


*Questions*:
- 

*Initial Ideas and Mental Models*:
- Analyze the patterns, and replicate

# EXAMPLES/TESTS

```
star(7)

*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *

star(9)

*   *   *
 *  *  *
  * * *
   ***
*********
   ***
  * * *
 *  *  *
*   *   *
```

# DATA STRUCTURES

Input: Integer
Intermediate: An array of rows (strings)
- Accumulation purposes
- Printing purposes

# ALGORITHM

Given an odd grid size integer `n`:
- Initialize an empty array of `rows`
- Generate top half and append**
  - Size: (`n` - 1) / 2 rows
- Generate middle row and append**:
  - Size: One row
- Generate bottom half and append**
  - Size: (`n` - 1) / 2 rows

**Tradeoff**:
- We aren't optimizing for efficiency but readability
- If we wanted efficiency, we wouldn't recreate the rows twice

*Sub-Problems*:

## Build the top half rows

Given a grid size `n`:
- Detmine the height of the row: (`n` - 1) / 2
- Initialize an empty array of `rows`
- Iterate `height` times, tracking the `row_index`:
  - Determine the `separator_spacing` spacing: (`height` - `row_index` - 1)
  - Create a string of three stars, separated by `separator_spacing`
  - Center justify that string with spaces inside a width of `n`
  - Append that string to `rows`
- Return the `rows`

## Build the middle row

Given a grid size `n`:
- Create a string of `n` *'s

## Build the bottom half rows

Given a grid size `n`:
- Build the top half rows for a grid size of `n`
- Reverse the top half rows

# CODE

*Implementation Details*:
- top_half method
- bottom_half method: calls #reverse on top half
- #center for center justification