# Bubble Sort

# PROBLEM

*Explicit Requirements*:
- **Input**: An `array`
  - The array will contain at least 2 elements
- **Side Effects**: 
  - `array` should be sorted
- **Rule**: Bubble sort should be the implemented sorting algorithm
  - The return value must be in place (`array` should be mutated)

*Implicit Requirements*:
- The input array can contain elements of any type
- The array's elements will be of a consistent type

*Edge Cases*:
- The array is already sorted
  - The original array should be the same, unmutated
- The array only contains 2 elements
  - Iterate from 0 to 0 (one iteration)

*Questions*:
- Can we assume the array contains elements of all the same data type?
- Can we compare elements using the various > implementation for the types of elements being compared?
- What should the method itself return? Do we care about the return value?

*Initial Ideas and Mental Models*:
- *Minor Optimization Technique*: Only iterate up to the #s that aren't already sorted (i.e. iterate up to a progressively smaller #)

# EXAMPLES/TESTS

array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# DATA STRUCTURES

- Input: Array
- Output: ?
- Intermediate: No intermediate data structure is needed. We are sorting the array in place.

# ALGORITHM

Given an `array`:
- Iterate from the length of the array minus 2 to 0, tracking the current `ending_index`:
  - Initialize a `swap_occured` flag to false
  - Iterate from 0 to `index`, tracking the current:
    - If the element at index 0 and index 1 are out of place**:
      - Swap them (use parallel assignment)
      - Set the `swap_occured` flag to true
    - Otherwise, skip over the iteration
  - If no `swap_occured` in this pass, break from the method (sorting is complete)
- [At this point, the array should be sorted (we went through all possible passes)]

*Sub-Problems*:

## Determine if two elements are out of place

Given two elements:
- They are out of place if the first element is greater than the second element
- 

# CODE

*Implementation Details*:
- Use parallel assignment for swapping