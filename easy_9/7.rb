# Name Swapping

# Solution 1: Straightforward

def swap_name(full_name)
  first, last = full_name.split
  "#{last}, #{first}"
end

puts swap_name('Joe Roberts') == 'Roberts, Joe'

# Solution 2: Clever

def swap_name_v2(full_name)
  full_name.split.reverse.join(', ')
end

puts swap_name_v2('Joe Roberts') == 'Roberts, Joe'
