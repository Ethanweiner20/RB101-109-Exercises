# Seeing Stars

def star(n)
  puts top_half(n) + [middle(n)] + bottom_half(n)
end

def top_half(n)
  height = (n - 1) / 2
  height.times.each_with_object([]) do |row_index, rows|
    separator = ' ' * (height - row_index - 1)
    row = "*#{separator}*#{separator}*".center(n)
    rows << row
  end
end

def middle(n)
  '*' * n
end

def bottom_half(n)
  top_half(n).reverse
end

# Better: Array.new(3, '*).join(separator)

star(7)
star(9)
