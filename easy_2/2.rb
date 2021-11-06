# How big is the room?

# PROBLEM

=begin

Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

To be more specific, store the units of the area in a hash:

Store measurements in a hash to assist with conversions

A Measurement is a Hash:
{
  number: Integer,
  units: string
}

Wish List:
- area(length, width)
- to_sq_ft(sq_meters)

Info:
- 1 sq m = 10.7639 sq ft

=end

# ALGORITHM

=begin

Retrieve length & width from users (meters)
SUBPROCESS area
- Retrieve area (square meters)
SUBPROCESS to_sq_feet
- Convert to sq feet

=end

CONVERSION_FACTOR = 10.7639

def area(length, width)
  length * width
end

def to_sq_feet(sq_meters)
  sq_meters * CONVERSION_FACTOR
end

def format_area(area)
  format("%.2f", area)
end

puts "What is length of the room (in meters)?"
length_input = gets.chomp

puts "What is width of the room (in meters)?"
width_input = gets.chomp

area_sq_meters = area(length_input.to_f, width_input.to_f)
area_sq_feet = to_sq_feet(area_sq_meters)

# Avoid sacrificing precision in calculations until the end
puts "The area of the room is #{format_area(area_sq_meters)} square meters (#{format_area(area_sq_feet)} square feet)."
