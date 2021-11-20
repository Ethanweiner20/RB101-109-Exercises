# Multiply Lists

# Solution 1 (imperative)

def multiply_list(list1, list2)
  products = []
  index = 0

  while index < list1.length && index < list2.length
    products << list1[index] * list2[index]
    index += 1
  end

  products
end

puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# Solution 2 (condensed)

def multiply_list_v2(list1, list2)
  list1.zip(list2).map { |arr| arr[0] * arr[1] }
end

puts multiply_list_v2([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
