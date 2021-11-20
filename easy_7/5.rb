# Staggered Caps (Part 1)

# Refactor to use reduce

# A pattern must be one of:
# - 0 (start with uppercase)
# - 1 (start with lowercase)

def staggered_case(string, pattern: 0)
  result = ''
  string.chars.each_with_index do |char, index|
    result << ((index + pattern).even? ? char.upcase : char.downcase)
  end
  result
end

puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
puts staggered_case('ALL_CAPS', pattern: 1) == 'aLl_cApS'

