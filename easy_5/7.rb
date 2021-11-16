# Ideas

=begin

- Create a separate method to compute the size of a word
  - Replace all non-letters with an empty character
  - Iterate to determine word size

=end

# Letter Counter (Part 2)

def word_sizes(string)
  size_counts = Hash.new(0)

  string.split(' ').each do |word|
    size_counts[word_size(word)] += 1
  end

  size_counts
end

def word_size(word)
  word.delete('^a-zA-Z]').size
end

# Note: Hashes are unordered, so these test cases still pass
p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}