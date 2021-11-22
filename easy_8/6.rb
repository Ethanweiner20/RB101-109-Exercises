# Fizzbuzz

def fizzbuzz(start_number, end_number)
  items = start_number.upto(end_number).map { |number| fizzbuzz_value(number) }
  print items.join(', ')
end

def fizzbuzz_value(number)
  if number % 3 == 0 && number % 5 == 0
    "FizzBuzz"
  elsif number % 3 == 0
    "Fizz"
  elsif number % 5 == 0
    "Buzz"
  else
    number.to_s
  end
end

fizzbuzz(1, 15)
# -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
