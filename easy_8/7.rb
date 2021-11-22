# Double Char (Part 1)

def repeater(string)
  string.chars.map { |char| char * 2 }.join
end

puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''