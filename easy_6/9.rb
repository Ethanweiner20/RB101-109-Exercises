# Does My List Include This?

def include?(array, search_value)
  array.each { |element| return true if element == search_value }
  false
end

puts include?([1,2,3,4,5], 3) == true
puts include?([1,2,3,4,5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false

# Doesn't work, because if #find finds nil, then it will return nil, which is 
# evaluated as falsey
# def include_v2?(array, search_value)
#   return true if array.find { |element| element == search_value }
#   false
# end

# puts include_v2?([1,2,3,4,5], 3) == true
# puts include_v2?([1,2,3,4,5], 6) == false
# puts include_v2?([], 3) == false
# puts include_v2?([nil], nil) == true
# puts include_v2?([], nil) == false

# On the other hand, #find_index works, because it returns nil if the element is
# not in the array

def include_v3?(array, search_value)
  !!array.find_index(search_value)
end

puts include_v3?([1,2,3,4,5], 3) == true
puts include_v3?([1,2,3,4,5], 6) == false
puts include_v3?([], 3) == false
puts include_v3?([nil], nil) == true
puts include_v3?([], nil) == false