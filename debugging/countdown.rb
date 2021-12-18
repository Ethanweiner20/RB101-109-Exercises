# Countdown

def decrease(counter)
  counter - 1
end

counter = 10

counter.times do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'

=begin

There are two local variable in this code: one initialized in the outer scope,
the other initialized in the scope of the `decrease` method.

The value the outer scope local variable `counter` points to is passed to the
`decrease` method invocation on each iteration of `times`, and is assigned
to the local variable `counter` in the decrease method. However, the `decrease`
method merely reassigns local variable `counter` to a new integer, which has no
effect on the original object referenced by the outer scope `counter`.

Options for fixing:
- Directly mutate integer (impossible b/c integers are immutable)
- Decrease the counter directly in the method
- Reassign the counter to the return value of `decrease`

In the `decrease` method invocation, the `counter` local variable is reassigned
to a new object that is one less than the original 

=end