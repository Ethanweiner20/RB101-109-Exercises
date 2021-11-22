# Palindromic Substrings

def palindromes(str)
  substrings(str).select { |substring| palindrome?(substring) }
end

def palindrome?(str)
  str = str.downcase.delete("^a-z0-9")
  !!(str.length > 1 && str == str.reverse)
end

def substrings(str)
  0.upto(str.length - 1).reduce([]) do |substrings, start|
    substrings + leading_substrings(str[start..-1])
  end
end

def leading_substrings(str)
  1.upto(str.length).each_with_object([]) { |count, arr| arr << str[0, count] }
end

puts palindromes('abcd') #== []
puts palindromes('Madam') #== ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') 
# == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
puts palindromes('knitting cassettes') 
# == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]

# Further Exploration

=begin

How to ignore non-alphanumeric characters:
- Remove them from the string when determining if it's palindromic

How to ignore case:
- Downcase the string when determining if it's palindromic

=end