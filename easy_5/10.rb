# Bannerizer

# def print_in_box(text)
#   inner_width = text.length + 2
#   outer_line = create_line('+', '-', inner_width)
#   inner_line = create_line('|', ' ', inner_width)
#   middle_line = '| ' + text + ' |'

#   puts [outer_line, inner_line, middle_line, inner_line, outer_line]
# end

# def create_line(outer_char, inner_char, inner_width)
#   outer_char + (inner_char * inner_width) + outer_char
# end

# print_in_box('To boldly go where no one has gone before.')
# print_in_box('')

# Further Exploration: Word Wrapping

MAX_WIDTH = 80

def print_in_box_with_wrap(text)
  box_width = [text.length + 4, MAX_WIDTH].min

  horizontal_rule = create_border('+', '-', box_width)
  empty_line = create_border('|', ' ', box_width)
  text_lines = create_lines(text, box_width)

  puts horizontal_rule
  puts empty_line
  puts text_lines
  puts empty_line
  puts horizontal_rule
end

def create_border(outer_char, inner_char, box_width)
  outer_char + (inner_char * (box_width - 2)) + outer_char
end

def create_lines(text, width)
  text_lines = wrap_text(text, width - 4)
  text_lines.map { |line| '| ' + line + ' |'}
end

def wrap_text(text, line_length)
  lines = []
  words = text.split
  starting_word_index = 0

  while starting_word_index < words.length
    # Determine the words to put in the next line
    words_in_line = create_line(words[starting_word_index..-1], line_length)

    # Create the proper-length line associated with the words
    lines << words_to_line(words_in_line, line_length)

    starting_word_index += words_in_line.length
  end

  lines
end

def create_line(words, line_length)
  line = []
  words.each do |word|
    break if line.join(' ').length + word.length >= line_length
    line << word
  end
  line
end

def words_to_line(words, line_length)
  words.join(' ').ljust(line_length)
end

p create_line(["Chris", "is", "very", "cool"], 16) == ["Chris", "is", "very"]
p wrap_text("Chris is very cool", 16) == ["Chris is very   ", "cool            "]
p create_lines("Chris is very cool", 20) == ["| Chris is very    |", "| cool             |"]

# puts create_middle_lines("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 80)

puts print_in_box_with_wrap("Chris is very cool")
puts print_in_box_with_wrap("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
puts print_in_box_with_wrap("")
