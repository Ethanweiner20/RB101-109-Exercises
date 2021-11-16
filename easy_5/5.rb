# Solution 1: String substitution w/ pattern matching

def cleanup(string)
  condense_whitespace(string.gsub(/[^a-z]/, ' '))
end

# Condense any sequences of spaces in _string_ to a singular space
def condense_whitespace(string)
  string.gsub(/\s+/, ' ')
end

# puts cleanup("---what's my +*& line?") == ' what s my line '

# Solution 2: Iterative

def cleanup_v2(string)
  string = replace_with_spaces(string)
  condense_whitespace_v2(string)
end

def replace_with_spaces(string)
  string.gsub(/[^a-z]/, ' ')
end

# Condense any sequences of spaces in _string_ to singular spaces
def condense_whitespace_v2(string)
  result = ''

  string.each_char do |char|
    if char == ' '
      result << char unless result[-1] == ' '
    else
      result << char
    end
  end

  result
end

# puts condense_whitespace_v2("   what s my  line  ") #== " what s my line " 


# Solution 3: Iterative

ALPHABET = ('a'...'z').to_a

def cleanup_v3(string)
  result = ' '

  string.each_char do |char|
    if ALPHABET.include?(char)
      result << char
    else
      result << ' ' unless result[-1] == ' '
    end
  end

  result
end

puts cleanup("---what's my +*& line?") == ' what s my line '
puts cleanup_v2("---what's my +*& line?") == ' what s my line '
puts cleanup_v3("---what's my +*& line?") == ' what s my line '
