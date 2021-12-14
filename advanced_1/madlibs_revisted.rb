REPLACEMENT_WORDS = {
  adjective: %w(quick lazy sleepy ugly),
  noun: %w(fox dog head leg),
  verb: %w(jumps lifts bites licks),
  adverb: %w(easily lazily noisily excitedly)
}

# Solution 1

def madlibs(text_file, replacement_words)
  text = File.read(text_file)

  while contains_placeholder?(text)
    text = format(text, staging_area(replacement_words)) # Recursive feel
  end

  puts text
end

def contains_placeholder?(text)
  !!(text =~ /%\{[a-z]*\}/)
end

def staging_area(replacement_words)
  replacement_words.transform_values(&:sample)
end

madlibs("madlibs_file.txt", REPLACEMENT_WORDS)

# Solution 2 (assumes that each line only uses one of each word type)

def madlibs_v2(text_file, replacement_words)
  text = File.read(text_file)
  lines = text.split("\n").map do |line|
    format(line, staging_area(replacement_words))
  end
  puts lines
end

madlibs_v2("madlibs_file.txt", REPLACEMENT_WORDS)
