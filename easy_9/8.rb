# Sequence Count

def sequence(count, start)
  multiple = 0
  count.times.reduce([]) do |sequence|
    multiple += start
    sequence + [multiple]
  end
end

puts sequence(5, 1) == [1, 2, 3, 4, 5]
puts sequence(4, -7) == [-7, -14, -21, -28]
puts sequence(3, 0) == [0, 0, 0]
puts sequence(0, 1000000) == []

def sequence_v2(count, start)
  (1..count).map { |multiplier| start * multiplier }
end

puts sequence_v2(5, 1) == [1, 2, 3, 4, 5]
puts sequence_v2(4, -7) == [-7, -14, -21, -28]
puts sequence_v2(3, 0) == [0, 0, 0]
puts sequence_v2(0, 1000000) == []