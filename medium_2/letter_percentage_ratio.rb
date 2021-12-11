# Letter Percentage Ratio

require 'pry'

def letter_percentages(string)
  letter_counts = { lowercase: 0, uppercase: 0, neither: 0 }
  string.each_char { |char| letter_counts[character_type(char)] += 1 }
  letter_counts.transform_values { |count| percentage(count, string.length) }
end

def character_type(char)
  case char
  when /[a-z]/ then :lowercase
  when /[A-Z]/ then :uppercase
  else :neither
  end
end

def percentage(count, total)
  ((count.to_f / total) * 100).round(1)
end

puts letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
puts letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
puts letter_percentages('abcdefGHI') == { :lowercase=>66.7, :uppercase=>33.3, :neither=>0.0 }

# Solution 2: Using #count to compute case percentages as we progress

CASES = {
  lowercase: 'a-z',
  uppercase: 'A-Z',
  neither: '^a-zA-Z'
}

def letter_percentages_v2(string)
  CASES.each_with_object({}) do |(letter_case, pattern), percentages|
    percentages[letter_case] = percentage_v2(pattern, string)
  end
end

def percentage_v2(pattern, string)
  (string.count(pattern).to_f / string.length * 100).round(1)
end

puts letter_percentages_v2('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
puts letter_percentages_v2('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
puts letter_percentages_v2('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
puts letter_percentages_v2('abcdefGHI') == { :lowercase=>66.7, :uppercase=>33.3, :neither=>0.0 }
