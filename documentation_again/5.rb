a = %w(a b c d e) # => ["a", "b"...]
puts a.fetch(7) # => Raises an error (#fetch requires a default_value or block if the index is out of bounds)
puts a.fetch(7, 'beats me') # => "beats me" (default value)
puts a.fetch(7) { |index| index**2 } # => "49" (evaluates the block with index)