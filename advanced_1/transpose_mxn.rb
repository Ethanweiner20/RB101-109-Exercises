# Transpose mxn

# Solution 1: Convert rows => columns; initialize empty rows & add elements in a
# downwards fashion

def transpose(matrix)
  transposed_matrix = empty_matrix(matrix[0].size)

  matrix.each do |row|
    row.each_with_index do |element, index|
      transposed_matrix[index] << element
    end
  end

  transposed_matrix
end

def empty_matrix(num_rows)
  num_rows.times.each_with_object([]) { |_, matrix| matrix << Array.new }
end

puts transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
puts transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
puts transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
puts transpose([[1]]) == [[1]]

# Solution 2: Convert columns => rows

def transpose_v2(matrix)
  num_columns = matrix.first.size
  (0...num_columns).each_with_object([]) do |column_index, transposed_matrix|
    new_row = retrieve_column(matrix, column_index)
    transposed_matrix << new_row
  end
end

def retrieve_column(matrix, column_index)
  num_rows = matrix.size
  (0...num_rows).map { |row_index| matrix[row_index][column_index] }
end

puts transpose_v2([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
puts transpose_v2([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
puts transpose_v2([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
puts transpose_v2([[1]]) == [[1]]