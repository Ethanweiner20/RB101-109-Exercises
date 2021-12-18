# Valid Series

=begin

The last test case passes the condition for the series summing to 47, but its
odd number count is only 1, so it should return false, but returns true. This
is because on line 5, `odd_count` is reassigned to the integer `3`. The intended
usage of `odd_count` was to be compared to the integer `3` for equality,
presumably with the `==` operator, but instead, the `=` operator results in
reassignment to the integer `3`. Assignment returns the object that was
assigned, which in this case is `3`. Integers are truthy, so the condition in 
the ternary expression on line 5, `odd_count = 3`, evaluates to `true`, causing
the ternary expression as a whole to return `true`, regardless of the value of
`nums`. Therefore, the last case faultily returns `true`.

Further Exploration:

No. The ternary operator is redundant.

=end