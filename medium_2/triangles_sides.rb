# Triangle Sides

def triangle(side1, side2, side3)
  if invalid?(side1, side2, side3)
    :invalid
  elsif equilateral?(side1, side2, side3)
    :equilateral
  elsif isosceles?(side1, side2, side3)
    :isosceles
  else
    :scalene
  end
end

def invalid?(side1, side2, side3)
  [side1, side2, side3].any?(0) || sides_incompatible?(side1, side2, side3)
end

def sides_incompatible?(side1, side2, side3)
  sides = [side1, side2, side3].sort
  longest_side = sides.pop
  longest_side >= sides.sum
end

def equilateral?(side1, side2, side3)
  side1 == side2 && side2 == side3
end

def isosceles?(side1, side2, side3)
  side1 == side2 || side2 == side3 || side1 == side3
end
  
p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

# p isosceles?(3, 3, 3) == true
# p isosceles?(3, 3, 1) == true
# p isosceles?(3, 2, 1.5) == false

# p equilateral?(3, 3, 3) == true
# p equilateral?(3, 3, 1) == false

# p invalid?(0, 3, 3) == true
# p invalid?(3, 1, 1) == true
# p invalid?(3, 1.5, 1.5) == true
# p invalid?(3, 4, 5) == false

# Better, refactored solution

def triangle_v2(*sides)
  if sides.any?(0) || sides.max * 2 >= sides.sum
    :invalid
  elsif sides[0] == sides[1] && sides[1] == sides[2]
    :equilateral
  elsif sides[0] == sides[1] || sides[1] == sides[2] || sides[0] == sides[2]
    :isosceles
  else
    :scalene
  end
end

p triangle_v2(3, 3, 3) == :equilateral
p triangle_v2(3, 3, 1.5) == :isosceles
p triangle_v2(3, 4, 5) == :scalene
p triangle_v2(0, 3, 3) == :invalid
p triangle_v2(3, 1, 1) == :invalid


def triangle_v3(side1, side2, side3)
  sides = [side1, side2, side3]
  largest_side = sides.max

  case
  when 2 * largest_side > sides.reduce(:+), sides.include?(0)
    :invalid
  when side1 == side2 && side2 == side3
    :equilateral
  when side1 == side2 || side1 == side3 || side2 == side3
    :isosceles
  else
    :scalene
  end
end

p triangle_v3(4, 2, 2)
