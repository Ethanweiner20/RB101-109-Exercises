# Matching Parentheses

# Solution 1

def balanced?(string)
  paren_state = 0
  string.each_char do |char|
    case char
    when '(' then paren_state += 1
    when ')' then paren_state -= 1
    end
    return false if paren_state < 0
  end
  paren_state.zero?
end

# puts balanced?('What (is) this?') == true
# puts balanced?('What is) this?') == false
# puts balanced?('What (is this?') == false
# puts balanced?('((What) (is this))?') == true
# puts balanced?('((What)) (is this))?') == false
# puts balanced?('Hey!') == true
# puts balanced?(')Hey!(') == false
# puts balanced?('What ((is))) up(') == false

# Further Exploration

def balanced_v2?(string)
  stacks = {
    paren: [],
    square_bracket: [],
    curly_bracket: []
  }

  string.each_char do |char|
    case char
    when '(' then stacks[:paren].push('(')
    when ')' then return false unless stacks[:paren].pop
    when '[' then stacks[:square_bracket].push('[')
    when ']' then return false unless stacks[:square_bracket].pop
    when '{' then stacks[:curly_bracket].push('[')
    when '}' then return false unless stacks[:curly_bracket].pop
    end
  end

  stacks.all? { |_, stack| stack.empty? }
end

# puts balanced_v2?('What (is) this?') == true
# puts balanced_v2?('What is) this?') == false
# puts balanced_v2?('What (is this?') == false
# puts balanced_v2?('((What) (is this))?') == true
# puts balanced_v2?('((What)) (is this))?') == false
# puts balanced_v2?('Hey!') == true
# puts balanced_v2?(')Hey!(') == false
# puts balanced_v2?('What ((is))) up(') == false

# Further Exploration: Best

=begin
This solution makes sure that parens are balanced not only in the sense
that they come in matching pairs, but that they follow the expected
logical order.
=end


PAIRS = {
  '(' => ')',
  '[' => ']',
  '{' => '}',
}

def balanced_v3?(string)
  balance_stack = []

  string.each_char do |char|
    if PAIRS.keys.include?(char)
      balance_stack << char
    elsif PAIRS.values.include?(char)
      balanced = balance_stack.pop == PAIRS.key(char)
      return false unless balanced
    end
  end
  balance_stack.empty?
end

puts balanced_v3?('What [(is)] this?') == true
puts balanced_v3?('What [(is) this?') == false
puts balanced_v3?('What [(is]) this?') == false
puts balanced_v3?('{What [(is) this]?}') == true
puts balanced_v3?('({What [(is) this]?})') == true
puts balanced_v3?('({What [(is) this]?)}') == false


# Accounting for quotations...

# Rule: A quotation pair can't be nested inside another quotation pair

def balanced_v4?(string)
  balance_stack = []

  string.each_char do |char|
    if ['"', "'"].include?(char) && !balance_stack.include?(char)
      balance_stack << char
    elsif ['"', "'"].include?(char)
      return false unless balance_stack.pop == char
    elsif PAIRS.keys.include?(char)
      balance_stack << char
    elsif PAIRS.values.include?(char)
      return false unless balance_stack.pop == PAIRS.key(char)
    end
  end
  balance_stack.empty?
end

puts balanced_v4?('What [(is)] this?') == true
puts balanced_v4?('What [(is) this?') == false
puts balanced_v4?('What [(is]) this?') == false
puts balanced_v4?('{What [(is) this]?}') == true
puts balanced_v4?('({What [(is) this]?})') == true
puts balanced_v4?('({What [(is) this]?)}') == false
puts balanced_v4?('({What [("is") this]?})') == true
puts balanced_v4?('({What "[(is) this]?"})') == true
puts balanced_v4?("({What [('is') this]?})") == true
puts balanced_v4?("({What [('i('s')') this]?})") == false

