# Merge Sort

# PROBLEM

*Explicit Requirements*:
- **Input**: An `array` of only numbers or only string
- **Output**: The array sorted by merge sort

*Implicit Requirements*:
- `array` can be of any length, including odd lengths

*Edge Cases*:
- The array doesn't divide evenly

*Questions*:
- Can we mutate the input array?

*Initial Ideas and Mental Models*:
- Split the array into subarray
- Use the algorithm from previous example to sort already sorted lists

# EXAMPLES/TESTS

```ruby
merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
merge_sort([5, 3]) == [3, 5]
merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
```

# DATA STRUCTURES

- Input: Array
- Output: Array
- Intermediate: Nested array

# ALGORITHM

*High-Level*:

Given an `array`:
- Divide the `array` into nested arrays, in which each sub-array contains 2 elements**
  - *Except for the final level arrays that only contain one element*
- Merge the lists back together**

*Sub-Problems*:

## Divide the array

e.g. 
[6, 2, 7, 1, 4] ->
[[6, 2, 7], [1, 4]] ->
[[[6, 2], [7]], [[1], [4]]] ->
[[[[6], [2]], [7]], [[1], [4]]]

Given an `array`:
- If the array contains 1 element:
  - Return the array (it's already split)
- Otherwise:
  - Divide the first half of the array
  - Divide the second half of the array
  - Return a new array with the first half and the second half as sub-arrays

## Merge sub-arrays

Given an `array` of nested arrays, in which each sub-array is a 2-element pair:
- [Base case] If the element is a one-element array, just return itself
- [Recursive case]
  - Merge the sub-arrays of each pair element, store in `merged_left` and `merged_right`
  - Return the result of merging the `merged_left` and `merged_right` array

# CODE

*Implementation Details*: