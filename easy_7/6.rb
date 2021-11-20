# Staggered Caps (Part 2)

# Ignore non-alphabetic characters when alternating

# Solutions:
# - Switch from an index to a toggle variable
# - Manually increment the index depending on the value of the current character

def staggered_case(string, count_all_characters: false)
  is_uppercase = false

  characters = string.chars.map do |char|
    if char =~ /[a-zA-Z]/
      is_uppercase = !is_uppercase
      is_uppercase ? char.upcase : char.downcase
    else
      is_uppercase = !is_uppercase if count_all_characters
      char
    end
  end

  characters.join
end

puts staggered_case('I Love Launch School!', count_all_characters: true) == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
