require 'date'

puts Date.civil # returns <Date: -4712-01-01> ==> #to_s ==> "-4712-01-01" ==> "-4712-01-01" is printed
puts Date.civil(2016) # returns <Date: 2016-01-01> ==> #to_s ==> "2016-01-01" ==> "2016-01-01" is printed
puts Date.civil(2016, 5) # returns <Date: 2016-05-01> ==> #to_s ==> "2016-05-01" ==> "2016-05-01" is printed
puts Date.civil(2016, 5, 13) # returns <Date: 2016-05-13> ==> #to_s ==> "2016-05-13" ==> "2016-05-13" is printed

# The Date::civil method returns a Date object, based on the provided parameters and defaults. Puts will convert this return value of a string, so we must consider the Date#to_s method to determine what puts will print.