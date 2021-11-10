# Palindromic Strings (Part 2)

# Solution 1

def palindrome?(string)
  string == string.reverse
end

def alphanumeric_string(string)
  filtered_chars = string.downcase.chars.select do |char|
    char =~ /[a-z1-9]/
  end
  filtered_chars.join
end

def real_palindrome?(string)
  palindrome?(alphanumeric_string(string))
end

puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false

# Solution 2

def alphanumeric_chars(string)
  string.downcase.chars.select { |char| char =~ /[a-z1-9]/ }
end

def real_palindrome_v2?(string)
  chars = alphanumeric_chars(string)
  chars.each_index do |index|
    return false if chars[index] != chars[-1 - index]
  end
  true
end

puts real_palindrome_v2?('madam') == true
puts real_palindrome_v2?('Madam') == true           # (case does not matter)
puts real_palindrome_v2?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome_v2?('356653') == true
puts real_palindrome_v2?('356a653') == true
puts real_palindrome_v2?('123ab321') == false

def real_palindrome_v3?(string)
  string = string.downcase.delete('^a-z1-9')
  palindrome(string)
end