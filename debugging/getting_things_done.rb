# Getting Things Done

=begin

This error means that the stack, a system data structure used to store the
return values of method calls, has been overloaded with too many calls (or
more specifically, stack frames). `move` can't finish evaluating until its
inner `move` has finished evaluating, resulting in an infinite number of
recursive calls to `move`. The reason `move` never stops evaluating is because
there is no explicit return before the call to `move` on line 3, and `move`
itself is the implicit return. Even though `n` is one less on each iteration,
no condition exists to return something once `n` reaches a certain value.

Once the value of `from_array` no longer contains any elements, `from_array.shift`
simply returns `nil`, rather than raising an error. So instead, a SystemStackError
is raised once `move` has been called too large a number of times without
being resolved.

=end

# Solution

def move(n, from_array, to_array)
  return if n <= 0
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(5, todo, done)

p todo #=> ['coffee with Tom']
p done #=> ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

# Further Exploration

=begin

`from_array` will run out of elements to remove and append to `to_array`, so
for each recursive call in which `from_array` contains 0 elements, `from_array.shift`
will return `nil`, which is appended to `to_array`. So, the overall result is that
the array referenced by `to_array` will contain at least one `nil` element.

=end