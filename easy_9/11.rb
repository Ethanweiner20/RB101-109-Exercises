# Group Anagrams

# Solution 1

words = ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
         'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
         'flow', 'neon']

def anagram_groups(words)
  words.each_with_object([]) do |word, groups|
    unless groups.flatten.include?(word)
      anagrams = find_anagrams(word, words)
      groups << anagrams if anagrams.length >= 2
    end
  end
end

def find_anagrams(word, words)
  words.select { |candidate| anagram?(candidate, word) }
end

# def anagram?(w1, w2)
#   w1.length == w2.length && w1.chars.all? { |char| w2.chars.include?(char) }
# end

def anagram?(w1, w2)
  w1.chars.sort == w2.chars.sort
end

def display_groups(groups)
  groups.each { |group| p group }
end

display_groups(anagram_groups(words)) # => nothing