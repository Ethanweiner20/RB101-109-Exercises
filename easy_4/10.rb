# Convert a Signed Number to a String!

CHARS = ('0'..'9').to_a

def signed_integer_to_string(integer)
  result = integer_to_string(integer.abs)

  case integer <=> 0
  when 0 then result
  when 1 then '+' + result
  when -1 then '-' + result
  end
end

# Only deals with positive integers
def integer_to_string(integer)
  return CHARS[integer] if integer / 10 == 0 # Base case
  integer_to_string(integer / 10) + CHARS[integer % 10] # Append final digit
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
