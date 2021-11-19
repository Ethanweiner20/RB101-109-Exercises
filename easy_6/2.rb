# Delete Vowels

def remove_vowels(strings)
  strings.map { |string| remove_vowels_string(string) }
end

def remove_vowels_string(string)
  string.delete('aeiouAEIOU')
end

puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
puts remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']