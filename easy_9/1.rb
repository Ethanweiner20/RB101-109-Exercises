# Welcome Stranger

# CODE

def greetings(full_name, details)
  print "Hello, #{full_name.join(' ')}! "\
        "Nice to have a #{details[:title]} #{details[:occupation]} around."
end

# EXAMPLES

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.

