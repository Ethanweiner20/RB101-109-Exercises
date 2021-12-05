# Diamond

def diamond(n, outline: false)
  puts [diamond_half(n, outline),
        row(n, n, outline),
        diamond_half(n, outline).reverse]
end

def diamond_half(n, outline)
  num_stars = 1
  half = []
  while num_stars < n
    half << row(num_stars, n, outline)
    num_stars += 2
  end
  half
end

def row(num_stars, n, outline)
  stars = if num_stars == 1
            '*'
          elsif outline
            ('*' + (' ' * (num_stars - 2)) + '*')
          else
            '*' * num_stars
          end
  stars.center(n)
end

=begin
REPLACED W/ #center

def row(num_stars, n)
  padding = (n - num_stars) / 2
  (' ' * padding) + ('*' * num_stars) + (' ' * padding)
end
=end

=begin

diamond(1)

*


diamond(3)

 *
***
 *


 diamond(9)

    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *

=end