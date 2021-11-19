# Right Triangles

def triangle(n)
  rows = []
  1.upto(n) { |row_number| rows << row(row_number, n) }
  puts rows
end


# triangle(5)
# triangle(9)

# Further Exploration

# Part 1: Simply reverse the order of the rows

# Part 2: Reverse the rows individually

# An _orientation_ must be one of:
# - 'BR'
# - 'TR'
# - 'BL'
# - 'TL'

def triangle_v2(n, orientation='BR')
  rows = []

  1.upto(n) do |row_number|
    row = build_row(row_number, n)
    case orientation
    when 'BR' then rows.push(row)
    when 'TR' then rows.unshift(row)
    when 'BL' then rows.push(row.reverse)
    when 'TL' then rows.unshift(row.reverse)
    end
  end

  puts rows
end

def build_row(row_number, row_length)
  ' ' * (row_length - row_number) + '*' * row_number
end

# MAIN PROGRAM

side_length = nil

loop do
  print "Input a side length: "
  side_length = gets.chomp.to_i
  break if side_length.to_i > 0
end

orientation = nil

loop do
  print "Choose an orientation (BR, BL, TR, TL): "
  orientation = gets.chomp
  break if ['BR', 'BL', 'TR', 'TL'].include?(orientation)
end

triangle_v2(side_length, orientation)
