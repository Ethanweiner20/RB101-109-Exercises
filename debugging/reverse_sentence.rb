# Reverse Sentence

=begin

Currently, line 7 accesses individual strings from the `words` array via 
indexing. `String#+` is called directly on the indexed string element, with an
argument of `reversed_words`, which is an array. `String#+` expects a string
argument, so an error is raised here. To make the code behave as expected,
we want to prepend a one-element array of each string to the `reversed_words`.
So, we can change `words[i]` to `[words[i]]`. Now, line 7 will invoke the
Array#+ concatenation method, which expects an array argument.

=end