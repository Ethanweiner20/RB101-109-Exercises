# Double Doubles

def twice(number)
  double?(number) ? number : number * 2
end

def double?(number)
  number.to_s.length.even? && halves_match?(number.to_s)
end

def halves_match?(string)
  half_length = string.length / 2
  string[0, half_length] == string[half_length..-1]
end

puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10
