# Get The Middle Character

def center_of(string)
  middle_index = (string.length - 1) / 2
  string[middle_index, string.length.odd? ? 1 : 2]
end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'