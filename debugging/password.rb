# Password

password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
  new_password
end

def verify_password(password)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  password = set_password
end

verify_password(password)

=begin

An error is raised on line 14 becase no local variable password exists in the
scope defined by the `verify_password` method definition. Methods have self-
enclosing scopes, so `verify_password` is unable to access the `password` local
variable initialized in the outer scope.

A possible solution is to pass the `password` local variable as an argument to 
`verify_password`.

However, this is not enough for the program to behave as expected. The `set_password`
method invocation does not reassign the outer local variable password to the
new entired password `new_password`, instead it initializes an unused local
variable `password` to `new_password`. Since outer scope local variable password
is never reassigned, when verifying the password, `input` is compared against the value `nil`,
which will always return false, assuming the user gave input for the new password.

To fix this issue, passing the `password` local variable as an argument to `set_password`
is not enough. One possible solution is to set the return value of `set_password`
to the new password, and assign the outer scope variable `password` to this return value

=end