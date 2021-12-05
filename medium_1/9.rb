# Fibonacci Numbers (Procedular)

def fibonacci(n)
  previous, current = [0, 1]
  (n - 1).times { current, previous = current + previous, current }
  current
end

puts fibonacci(20) == 6765
puts fibonacci(100) == 354224848179261915075
puts fibonacci(100_001) # => 4202692702.....8285979669707537501