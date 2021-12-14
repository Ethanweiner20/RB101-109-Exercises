# Merge Sorted Lists

# PROBLEM

*Explicit Requirements*:
- **Input**: Two sorted lists, `list_1` and `list_2`
- **Output**: An array thar mareges the two lists such that they are ordered
- The result array should not need to be sorted; the result array should be constructed in a way that it is sorted
- The solution should not mutate the original arrays (e.g. don't use #pop)

*Implicit Requirements*:
- Duplicates should be preserved

*Edge Cases*:
- One array is empty: the other array should be returned
- The arrays contain two or more of the same element
  - Just append either element first

*Questions*:
- Can the input array contain non-integer elements?
  - I will assume that the elements in the array can be compared using `<`

*Initial Ideas and Mental Models*:
- Recursive solution: Produce the answer recursively (makes the most sense)
  - Double solution
- Iterate over both lists:
  - Compare elements & add the lesser
  - Once we have reached the end of either list, append the trailing elements
  from the other list

# EXAMPLES/TESTS

merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
merge([], [1, 4, 5]) == [1, 4, 5]
merge([1, 4, 5], []) == [1, 4, 5]

# DATA STRUCTURES

Input: Two arrays
Output: A single array
Intermediate: A single array to generate results

# ALGORITHM

## Solution 1: Iterative

Given two input lists, `list1` and `list2`:
- Initialize an empty `merged_list`
- Initialize `index1` and `index2` to 0
- Loop
  - If `index1` is the length of `list1`:
    - Add any trailing elements from `list2` to `merged_list`
    - Break from the loop
  - If `index2` is the length of `list2`:
    - Add any trailing elements from `list1` to `merged_list`
    - Break from the loop
  - Otherwise:
    - Compare the `index1`th element in `list1` to the `index`th element in `list2`
    - If the first element is less than or equal to the second, append the first element to `merged_list`
      - Also, increment `index1`
    - Otherwise, append the second element to `merged_list`
      - Also, increment `index2`
- Return the `merged_list`

## Solution 2: Recursive

Given two input lists, `list1` and `list2`:
- Base cases:
  - If `list1` is empty, return `list2`
  - If `list2` is emtpy, return `list1`
  - Otherwise:
    - Determine the next element to add, by comparing the first element of `list1` and `list2`
    - If we use first element of `list1`:
      - Merge the rest of `list1` with `list2`
    - If we use the first element of `list2`:
      - Merge the rest of `list2` with `list1`

*Benefit to recursive solution*: Naturally forms each iteration as its own sub-problem

*Sub-Problems*:




# CODE

*Implementation Details*: