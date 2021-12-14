require 'pry'

# Egyptian Fractions

def egyptian(rational_number)
  sum = Rational(0)
  denominators = []
  denominator = 1

  loop do
    next_sum = sum + Rational(1, denominator)
    unless (next_sum <=> rational_number) == 1
      denominators << denominator
      sum = next_sum
    end

    denominator += 1
    break if sum == rational_number
  end

  denominators
end

p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

def egyptian_v2(rational_number)
  denominators(rational_number, 1)
end

def denominators(remaining_number, denominator)
  unit_number = Rational(1, denominator)
  if remaining_number == 0
    []
  elsif (unit_number <=> remaining_number) == 1
    denominators(remaining_number, denominator + 1)
  else
    [denominator] + denominators(remaining_number - unit_number, denominator + 1)
  end
end

p egyptian_v2(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian_v2(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
# p egyptian_v2(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

def unegyptian(denominators)
  denominators.reduce(Rational(0)) do |sum, denominator|
    sum + Rational(1, denominator)
  end
end

puts unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
puts unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
puts unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
puts unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
puts unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
puts unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
puts unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
puts unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)