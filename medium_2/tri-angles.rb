# Tri-Angles

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]

  if angles.any? { |angle| angle <= 0 } || angles.sum != 180
    :invalid
  elsif angles.include?(90)
    :right
  elsif angles.find { |angle| angle > 90 }
    :obtuse
  else
    :acute
  end
end

puts triangle(60, 70, 50) == :acute
puts triangle(30, 90, 60) == :right
puts triangle(120, 50, 10) == :obtuse
puts triangle(0, 90, 90) == :invalid
puts triangle(50, 50, 50) == :invalid