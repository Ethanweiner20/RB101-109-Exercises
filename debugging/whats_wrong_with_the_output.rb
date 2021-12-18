# What's wrong with the output?

=begin

The problem is that `p` has a higher precedence than the `do..end` block, so
`arr.sort` is passed as an argument to `p`

=end

# Solution 1

arr = ["9", "8", "7", "10", "11"]
p(arr.sort do |x, y|
    y.to_i <=> x.to_i
  end)

# Fix: Add parentheses to bind the `do..end` block to the `sort` method
# invocation

# Solution 2

arr = ["9", "8", "7", "10", "11"]
p arr.sort { |x, y| y.to_i <=> x.to_i }

# This solution works because the `{...}` block has higher precedence than `p`,
# but it is not ideal because it relys on precedence rules
