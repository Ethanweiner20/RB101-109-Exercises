# Multiplicative Average

def show_multiplicative_average(integers)
  average = multiplicative_average(integers)
  puts format("%.3f", average)
end

def multiplicative_average(integers)
  integers.reduce(:*).to_f / integers.length
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667