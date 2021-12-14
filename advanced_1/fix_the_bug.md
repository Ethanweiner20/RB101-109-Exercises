# Fix the Bug

**Actually prints:**

[]
nil
nil
nil

```ruby
def my_method(array)
  if array.empty?
    []
  elsif array.length > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])
```

The bug is that the expected output for the `elsif` branch, which should be the
result of applying a transformation is missing. Instead, this expected output is
interpreted as the condition of the `elsif` branch. Based on the expected output,
the condition should return true only if the array contains more than one element.
So, to fix the code, we need to add that condition, as shown above.