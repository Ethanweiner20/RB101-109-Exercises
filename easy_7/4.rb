def swapcase(string)
  characters = string.chars.map do |char|
    case char
    when /[a-z]/ then char.upcase
    when /[A-Z]/ then char.downcase
    else char
    end
  end
  characters.join
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
