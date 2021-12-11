# Sum Square

def sum_square_difference(n)
  (1..n).to_a.sum**2 - (1..n).reduce { |sum, curr| sum + curr**2 }
end

puts sum_square_difference(3) == 22
puts sum_square_difference(10) == 2640
puts sum_square_difference(1) == 0
puts sum_square_difference(100) == 25164150

def sum_square_difference_v2(n)
  (1..n).sum**2 - (1..n).sum(&:abs2)
end

puts sum_square_difference_v2(3) == 22
puts sum_square_difference_v2(10) == 2640
puts sum_square_difference_v2(1) == 0
puts sum_square_difference_v2(100) == 25164150