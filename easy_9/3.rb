# Always Return Negative

def negative(number)
  number.positive? ? -number : number
end

puts negative(5) == -5
puts negative(-3) == -3
puts negative(0) == 0 # There's no such thing as -0 in ruby

# Try any other solutions?

# Further Exploration

=begin

The 2nd solution is superior in terms of its conciseness.

But in terms of almost everything else, it doesn't appear to be better:
- *Readability & intuitiveness*: The 1st solution clearly exhibits the functionality
requested by the problem description.
- *Complexity & efficiency*: While the implementation of `#abs`` isn't made
clear, we can infer that the second solution requires more total operations
than the first. The first simply performs a comparison with 0, and then returns
a value depending on that comparison. The second will first have to perform that
same comparison and conversion reversed, and then negate that result. Removing the layer of abstraction
`#abs` provides us, we can imagine the second solution does something like:

=end

def negative_v2(number)
  -abs(number)
end

def abs(number)
  number < 0 ? -number : number
end

# This clearly adds another layer of complexity.