# All Substrings

def substrings(str)
  0.upto(str.length - 1).reduce([]) do |substrings, start|
    substrings + leading_substrings(str[start..-1])
  end
end

def leading_substrings(str)
  1.upto(str.length).each_with_object([]) { |count, arr| arr << str[0, count] }
end

puts substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]