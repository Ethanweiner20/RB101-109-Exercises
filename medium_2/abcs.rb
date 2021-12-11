# ABCs

# Freeze the blocks so they don't mutate
BLOCKS = [
  ['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'], ['G', 'T'],
  ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'], ['V', 'I'], ['L', 'Y'],
  ['Z', 'M']
].freeze

# Solution 1: Robust - Checks every character to see if it can be spelled

def block_word?(string)
  blocks = BLOCKS.dup
  string.chars.all? do |char|
    match_any_block?(char, blocks)
  end
end

def match_any_block?(char, blocks)
  index_candidate = blocks.find_index { |block| block.include?(char.upcase) }
  blocks.delete_at(index_candidate) if index_candidate
  !!(index_candidate)
end

puts block_word?('BATCH') == true
puts block_word?('BUTCH') == false
puts block_word?('jest') == true

# Clever Solution: If no blocks are used more than once, then the string can be
# "spelled" with the block

def block_word_v2?(string)
  BLOCKS.none? { |block| used_multiple_times?(block, string) }
end

def used_multiple_times?(block, string)
  string.chars.count { |char| block.include?(char.upcase) } >= 2
end

puts block_word_v2?('BATCH') == true
puts block_word_v2?('BUTCH') == false
puts block_word_v2?('jest') == true


BLOCKS_V2 = {
  'b' => 'o', 'x' => 'k', 'd' => 'q', 'c' => 'p', 'n' => 'a',
  'g' => 't', 'r' => 'e', 'f' => 's', 'j' => 'w', 'h' => 'u',
  'v' => 'i', 'l' => 'y', 'z' => 'm'
}

def block_word_v3?(str)
  used_blocks = []
  str.downcase.chars do |letter|
    return false if str.downcase.chars.include?(BLOCKS_V2[letter]) ||
                    used_blocks.flatten.include?(letter)
    used_blocks << [letter, BLOCKS_V2[letter]]
  end
  true
end

puts block_word_v3?('BATCH') == true
puts block_word_v3?('BUTCH') == false
puts block_word_v3?('jest') == true
puts block_word_v3?('BATCHB') == false
