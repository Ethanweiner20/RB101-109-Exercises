def word_cap(string)
  string.split.map(&:capitalize).join(' ')
end

puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# Further Exploration

def word_cap_v2(string)
  string.split.map { |word| word.downcase.sub(word[0], word[0].upcase) }
        .join(' ')
end

puts word_cap_v2('four score and seven') == 'Four Score And Seven'
puts word_cap_v2('the javaScript language') == 'The Javascript Language'
puts word_cap_v2('this is a "quoted" word') == 'This Is A "quoted" Word'

LOWERCASE_LETTERS = ('a'..'z').to_a
LOWERCASE_TO_UPPERCASE = -32

# Using ASCII
def word_cap_v3(string)
  words = string.split.map do |word|
    word.downcase!
    if LOWERCASE_LETTERS.include?(word[0])
      word[0] = (word[0].ord + LOWERCASE_TO_UPPERCASE).chr
    end
    word
  end
  words.join(' ')
end

puts word_cap_v3('four score and seven') == 'Four Score And Seven'
puts word_cap_v3('the javaScript language') == 'The Javascript Language'
puts word_cap_v3('this is a "quoted" word') == 'This Is A "quoted" Word'