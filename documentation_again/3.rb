def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)

# Ruby fills in required arguments in order from left to right first. All other positional arguments are handled regularly. So, in this case, the call to my_method will print "[4, 5, 3, 6]". So a and b are assigned to 4 and 6 because they are prioritized as required parameters. Then b is assigned to 5 because it is the next remaining positional argument.