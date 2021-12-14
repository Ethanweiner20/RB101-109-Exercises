# Rotating Matrices

# Solution 1

# def rotate90(matrix)
#   num_columns = matrix.first.size
#   (0...num_columns).each_with_object([]) do |column_index, transposed_matrix|
#     new_row = retrieve_column(matrix, column_index).reverse
#     transposed_matrix << new_row
#   end
# end

def retrieve_column(matrix, column_index)
  num_rows = matrix.size
  (0...num_rows).map { |row_index| matrix[row_index][column_index] }
end

# Further Exploration

# Note: Angle must be a multiple of 90

def rotate(matrix, angle = 90)
  if angle == 0
    matrix
  else
    rotate(rotate90(matrix), angle - 90)
  end
end

def rotate90(matrix)
  transpose(matrix).map(&:reverse)
end

def transpose(matrix)
  num_columns = matrix.first.size
  (0...num_columns).each_with_object([]) do |column_index, transposed_matrix|
    new_row = retrieve_column(matrix, column_index)
    transposed_matrix << new_row
  end
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate(matrix1)
new_matrix2 = rotate(matrix2)
new_matrix3 = rotate(matrix2, 360)

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2