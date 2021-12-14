# Transpose 3x3

# Solution 1: Convert rows => columns (more complicated)

def transpose(matrix)
  transposed_matrix = [[], [], []]

  matrix.each do |row|
    row.each_with_index do |element, index|
      transposed_matrix[index] << element
    end
  end

  transposed_matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# Solution 2: Convert columns => rows (retrieve columns, append as rows)

def transpose_v2(matrix)
  transposed_matrix = []

  (0..2).each do |column_index|
    new_row = retrieve_column(matrix, column_index)
    transposed_matrix << new_row
  end

  transposed_matrix
end

# This is more clear, since we now we are retrieving that column
def retrieve_column(matrix, column_index)
  (0..2).map { |row_index| matrix[row_index][column_index] }
end

# Further Exploration

# This is bad . . .

def transpose!(matrix)
  (0...matrix.size).each do |column_index|
    (0..column_index).each do |row_index|
      matrix[row_index][column_index], matrix[column_index][row_index] =
        matrix[column_index][row_index], matrix[row_index][column_index]
    end
  end
end

transpose!(matrix)
p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
