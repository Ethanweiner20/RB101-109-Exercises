s = 'abc'
puts s.public_methods(false).inspect

# Per the Ruby docs, setting the "all" optional parameter to false makes #public_methods return only those methods in the class of the receiver (object that it is called on)