# Uppercase Check

# Solution 1

def uppercase?(str)
  str.chars.select { |char| char =~ /[a-z]/i }.all? { |char| char =~ /[A-Z]/ }
end

puts uppercase?('t') == false
puts uppercase?('T') == true
puts uppercase?('Four Score') == false
puts uppercase?('FOUR SCORE') == true
puts uppercase?('4SCORE!') == true
puts uppercase?('') == true

# Solution 2

def uppercase_v2?(str)
  !!(str.delete('^a-zA-Z') =~ /^[A-Z]*$/)
end

puts uppercase_v2?('t') == false
puts uppercase_v2?('T') == true
puts uppercase_v2?('Four Score') == false
puts uppercase_v2?('FOUR SCORE') == true
puts uppercase_v2?('4SCORE!') == true
puts uppercase_v2?('') == true

# Solution 3

# Match characters that are uppercase letters OR not letters at all
# The match returns true if that condition is met for all characters

def uppercase_v3?(str)
  !!(str =~ /^([A-Z]|[^a-zA-Z])*$/)
end

puts uppercase_v3?('t') == false
puts uppercase_v3?('T') == true
puts uppercase_v3?('Four Score') == false
puts uppercase_v3?('FOUR SCORE') == true
puts uppercase_v3?('4SCORE!') == true
puts uppercase_v3?('') == true

# Solution 4: The difference method

# A string is uppercase if (and only if) it contains NO lowercase letters

def uppercase_v4?(str)
  !(str =~ /[a-z]/)
end

puts uppercase_v4?('t') == false
puts uppercase_v4?('T') == true
puts uppercase_v4?('Four Score') == false
puts uppercase_v4?('FOUR SCORE') == true
puts uppercase_v4?('4SCORE!') == true
puts uppercase_v4?('') == true