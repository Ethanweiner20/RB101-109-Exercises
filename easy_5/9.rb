def crunch(string)
  string.chars.each_with_object('') do |char, crunched_string|
    crunched_string << char unless char == crunched_string[-1]
  end
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''

def crunch_regex(string)
  string.gsub(/(.)\1+/, '\1')
end

puts crunch_regex('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch_regex('a') == 'a'
puts crunch_regex('') == ''
