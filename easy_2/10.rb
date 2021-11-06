# PROBLEM

# What will the following code print, and why?

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
# Array 2 now contains the same references as array 1
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
# Mutates the objects both array1 and array2 point to
# => [Moe, Larry, CURLY, SHEMP, Harpo, CHICO, Groucho, Zeppo]
puts array2

# This will print:

=begin

Moe
Larry
CURLY
SHEMP
Harpo
CHICO
Groucho
Zeppo

=end

# Why? `array2` is constructed in a way such that every one of its elements is the same as `array1`. More specifically, the elements in `array1` and `array2` points to the same objects -- i.e. they are identical arrays. When each element of `array1` is conditionally mutated with #upcase!, the elements in `array2` follow suit, because they point to the same objects.

# Further Exploration

=begin

This feature could get you in trouble because mutation of an object stored in one variable (such as an array) might unexpectedly lead to mutations of objects stored elsewhere. Therefore, if such behavior is unintended, careful consideration must be made when copying variables or objects. If you want to copy the elements of one array into another array, make sure to actually copy each of the objects, so that the new array contains entirely new objects with different references. Likewise, if you want to copy the value at one variable into another variable, you must do more than just assign that variable. If you are not performing any mutating operations on these objects, then this is not a concern. But if you do plan to perform mutating operations, it is important to be aware when something is copied or passed by reference.

In the example above, you could avoid such behavior in a couple of ways:
=end

# 1. Copy the elements from `array1` into `array2`, creating new objects along the way:

puts "Avoiding double mutation: Solution 1"
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << String.new(value) }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# 2. Avoid performing any mutating operations while `array1` and `array2` point to the same elements:

puts "Avoiding double mutation: Solution 2"
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.map! { |value| value.upcase if value.start_with?('C', 'S') }
puts array2

puts "Avoiding double mutation: Solution 3"
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each_with_index { |value, index| array1[index] = value.upcase if value.start_with?('C', 'S') }
puts array2

