def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

=begin

The returned string will be a different object. Even though `str` points to the
same object as the "hello world" argument, the call to #join returns an entirely
new object. 

Right once #split is called on _str_, the original string object is lost from
the equation -- split returns a new array, whose object id (and element ids) are
not associated with its caller (_str_). Joining these elements back together
only adds another new object to the picture.

=end