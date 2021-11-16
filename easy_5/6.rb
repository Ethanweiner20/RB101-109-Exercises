# Letter Counter (Part 1)

def word_sizes(string)
  size_counts = Hash.new(0)

  string.split(' ').each do |word|
    size_counts[word.size] += 1
  end

  size_counts
end

# Note: Hashes are unordered, so these test cases still pass
p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}