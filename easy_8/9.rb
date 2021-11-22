# Reverse the Digits In a Number

# Solution 1: String-based reversal

def reversed_number(number)
  number.to_s.reverse.sub(/^0+/, '').to_i
end

puts reversed_number(12345) == 54321
puts reversed_number(12213) == 31221
puts reversed_number(456) == 654
puts reversed_number(12000) == 21 # No leading zeros in return value!
puts reversed_number(12003) == 30021
puts reversed_number(1) == 1

# Solution 2: Mathematic (not using reverse)

def reversed_number_v2(number)
  digits = number.digits
  place = digits.length - 1
  reversed_number = 0

  digits.each do |digit|
    reversed_number += digit * 10**place
    place -= 1
  end

  reversed_number
end

puts reversed_number_v2(12345) == 54321
puts reversed_number_v2(12213) == 31221
puts reversed_number_v2(456) == 654
puts reversed_number_v2(12000) == 21 # No leading zeros in return value!
puts reversed_number_v2(12003) == 30021
puts reversed_number_v2(1) == 1