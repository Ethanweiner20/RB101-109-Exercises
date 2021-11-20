# Lettercase Counter

# Solution 1

def letter_case_count(string)
  details = { lowercase: 0, uppercase: 0, neither: 0 }

  string.chars.each do |char|
    case char
    when /[a-z]/ then details[:lowercase] += 1
    when /[A-Z]/ then details[:uppercase] += 1
    else details[:neither] += 1
    end
  end

  details
end

puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# Solution 2

def letter_case_count_v2(string)
  {
    lowercase: string.chars.count { |element| element =~ /[a-z]/ },
    uppercase: string.chars.count { |element| element =~ /[A-Z]/ },
    neither: string.chars.count { |element| element =~ /[^a-zA-Z]/ } 
  }
end

puts letter_case_count_v2('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count_v2('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count_v2('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count_v2('') == { lowercase: 0, uppercase: 0, neither: 0 }