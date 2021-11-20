# Multiply All Pairs

def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map { |pair| pair.reduce(:*) }.sort
end

# You could have also extracted the elements from the pair directly, & multiplied them

puts multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]