def fibonacci(n)
  return 1 if n == 1 || n == 2
  fibonacci(n - 1) + fibonacci(n - 2)
end

puts fibonacci(1) == 1
puts fibonacci(2) == 1
puts fibonacci(3) == 2
puts fibonacci(4) == 3
puts fibonacci(5) == 5
puts fibonacci(12) == 144
puts fibonacci(20) == 6765

# Further Exploration

def fibonacci_v2(n)
  fibonacci_tail(n, 1, 0)
end

# acc1 represents the fibonacci # at n - 1
# acc2 represents the fibonacci # at n -2 
def fibonacci_tail(n, acc1, acc2)
  if n == 1 then acc1
  else fibonacci_tail(n - 1, acc1 + acc2, acc1)
  end
end

puts fibonacci_v2(1) == 1
puts fibonacci_v2(2) == 1
puts fibonacci_v2(3) == 2
puts fibonacci_v2(4) == 3
puts fibonacci_v2(5) == 5
puts fibonacci_v2(12) == 144
puts fibonacci_v2(20) == 6765