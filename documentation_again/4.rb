a = [1, 4, 8, 11, 12, 13, 14, 15, 16, 17, 18, 19]
puts a.bsearch { |ele| ele > 8 }

# When the block passed into #bsearch returns a boolean, it enters "find minimum mode", which, according to the Ruby docs, returns the first element in the array meeting the criteria specified by the block.