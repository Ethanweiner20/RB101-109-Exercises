# Neutralizer

def neutralize(sentence)
  words = sentence.split(' ')
  words.reject! { |word| negative?(word) }
  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.

=begin

The underlying problem lies in the fact that the array referenced by `words`
is mutated while simultaneously being iterated over. Such mutation can cause
unexpected effects, like skipping expected iterations.In this instance, upon
the iteration of `each` in which `word` references the element `"dull"`,
`"dull"` is deleted from `words`, because the statement modifier with `negative?`
returns true. `"dull"` is at index 1 in `words`. Logically, `each` will move to
index 2 of `words` for the next iteration. However, because `delete` destructively
modified `words` and removed `"dull"`, the word `"cards"` is now the element at
index 2 of `words`, while `"boring"` is at index 1. Therefore, the negative word
`"boring"` is never evaluated by the block passed as an argument to `each`,
and so is not removed from `words`.

=end