# Unlucky Days

# PROBLEM

*Explicit Requirements*:
- **Input**: A `year` (greater than 1752)
- **Output**: The # of Friday the 13ths in the `year` (as an integer)
- The Gregorian Calendar is being used

*Implicit Requirements*:
- The output should be an integer

*Edge Cases*:
- A Friday the 13th occurs on the first or last day of a year
  - Difficult to test this

*Questions*:

*Assumptions*:
- The implementation can use the Date class

*Initial Ideas and Mental Models*:
1. [Assuming we can use the Date class] Count the months in which the 13th day of the month is a Friday

# EXAMPLES/TESTS

friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2

# DATA STRUCTURES

- Input: Integer
- Ouput: Integer
- Intermediate: Array/range to store the months?

# ALGORITHM

Given a `year`:
- Count the # of months in the range [1, 12] that:
  - Have a Friday the 13th on the specified `year`**

*Sub-Problems*:

## Determine if a month has a Friday the 13th on a year

# -----------------------
# PROBLEM

Input: A `year` and a `month` (as an integer)
Output: Boolean specifying whether that particular `month` has a Friday the 13th

# ALGORITHM

Given a `year` and a `month`:
- Create a Date on `year`, `month`, and `day`
- If the Date is a Friday (Date#friday?), return true
- Otherwise, return false

# -----------------------


# CODE

*Implementation Details*:
- Date#civil can be used to create a new date from year/month/day
- Date#friday? can be used to check if the 13th of each month is a Friday

# Further Exploration

Given a `year`:
- Count the # of months in the range [1, 12] that:
  - Have 5 Fridays**

Given a `year`:
- Retrieve all the Fridays in `year`
- Group all the Fridays into their respective months
- Count the # of months w/ 5 Fridays

## Determine if a month on a particular year has 5 Fridays

# -----------------------
# PROBLEM

Input: A `year` and a `month`
Output: A Boolean indicating whether a month has 5 Fridays

*Mental Models*:
- Count the # of Fridays in `month`, & compare?

# EXAMPLES



# ALGORITHM

Ideas:
- Iterate over all the days in the month, count any that are Friday

Given a `year` and a `month`:
- Count the # of Fridays in `month`
  - From 1 to the total # of days:
    - Initialize a Date
    - Determine if that Date is Friday: if so, add to the count
- Return true if the # of Fridays is equal to 5

# -----------------------
