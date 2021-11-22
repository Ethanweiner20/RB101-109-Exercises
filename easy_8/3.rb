# Leading Substrings

# Solution 1

# Not sure about the readability: The block's return value is unclear

def leading_substrings(string)
  accumulator = ""

  string.chars.map { |char| accumulator += char }
end

puts leading_substrings('abc') == ['a', 'ab', 'abc']
puts leading_substrings('a') == ['a']
puts leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

def leading_substrings_v2(str)
  1.upto(str.length).each_with_object([]) { |count, arr| arr << str[0, count] }
end

puts leading_substrings_v2('abc') == ['a', 'ab', 'abc']
puts leading_substrings_v2('a') == ['a']
puts leading_substrings_v2('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']