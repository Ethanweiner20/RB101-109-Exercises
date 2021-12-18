# HEY YOU!

def shout_out_to(name)
  name = name.chars.map { |c| c.upcase }.join

  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'

=begin

The characters of the return value of the `chars` method invocation do not
reference the characters stored in the `name` string directly. Therefore, when
the block parameter `c`, which references each of these characters, is mutated
with "String#upcase!", this merely mutates the character, not the string `name`.

In order to produce the expected output, we should reassign name to a new string
in which each character is capitalized, or just call String#upcase! on the entire
`name` string.

=end