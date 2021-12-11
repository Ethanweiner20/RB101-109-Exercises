# Longest Sentence

def longest_sentence(text_file)
  string = File.open(text_file).read
  sentences = split(string)
  longest_sentence = sentences.max_by { |sentence| word_length(sentence) }
  puts "Longest Sentence: #{longest_sentence.strip}"
  puts "Length: #{word_length(longest_sentence)}"
end

# Further Exploration: Custom split operation that preserves puncutation
def split(string)
  sentence_accumulator = ''
  string.chars.each_with_object([]) do |char, sentences|
    sentence_accumulator << char
    if char =~ /\?|!|\./
      sentences << sentence_accumulator
      sentence_accumulator = ''
    end
  end
end

def word_length(sentence)
  sentence.split.length
end

longest_sentence("./example.txt")
longest_sentence("./frankenstein.txt")