# Exclusive Or

# PROBLEM
# ============================================================================

=begin

Write a function named `xor` that takes two arguments, and returns `true` if
exactly one of its arguments is truthy, `false` otherwise

Input:
- Two arguments of any type

Output:
- Boolean value

Clarifications:
- The output needs to be a boolean result. The || and && operators don't
actually return Boolean values. They simply return a truthy/falsey value,
which is useful in conditionals.
- The input can be any truthy/falsey value

a = 3 || 5
puts a => 3

Mental Model 1: Explicitly lay out all possible argument truthiness
combinations. Return a Boolean value based on those combinations.

Consider simplifications later.

Mental Model 2: Exactly one argument must evaluate to truthy. We could write
a conditional that evaluates to true when at least one argument is true (||),
but both arguments are not true (&&)

=end

# EXAMPLES/TESTS
# ============================================================================

=begin

xor?(5.even?, 4.even?) == true
xor?(5.odd?, 4.odd?) == true
xor?(5.odd?, 4.even?) == false
xor?(5.even?, 4.odd?) == false

=end

# CODE
# ============================================================================

# Mental Model 1: Explicitly lay out all possible argument combinations:
def xor?(arg1, arg2)
  if !!arg1 == true && !!arg2 == true then false
  elsif !!arg1 == true && !!arg2 == false then true
  elsif !!arg1 == false && !!arg2 == true then true
  elsif !!arg1 == false && !!arg2 == false then false
  end
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false

# Mental Model 2: Use other Boolean operators
def xor_v2?(arg1, arg2)
  if (arg1 || arg2) && !(arg1 && arg2)
    true
  else
    false
  end
end

puts xor_v2?(5.even?, 4.even?) == true
puts xor_v2?(5.odd?, 4.odd?) == true
puts xor_v2?(5.odd?, 4.even?) == false
puts xor_v2?(5.even?, 4.odd?) == false

# Solution 3: Logic simplification

# Either arg1 is false and arg2 is true, or vice versa

def xor_v3?(arg1, arg2)
  return true if (!arg1 && arg2) || (arg1 && !arg2)
  false # Explicitly return false
end

puts xor_v3?(5.even?, 4.even?) == true
puts xor_v3?(5.odd?, 4.odd?) == true
puts xor_v3?(5.odd?, 4.even?) == false
puts xor_v3?(5.even?, 4.odd?) == false

# Condensed

def xor_v4?(arg1, arg2)
  !!((!arg1 && arg2) || (arg1 && !arg2))
end

# Further Exploration

=begin

Situations in which an xor method would be useful:
- Homeostatic situations: Readjust to homeostatis if the conditions are above
XOR below homeostasis
- Game show buzzer: If two contestants buzz at the same time, don't activate
the circuit. But if either contestant buzzes, activiate the circuit.
- Cheating on your girlfriend: You can have one in your room at a time,
but you can't have both

Short circuit behavior:
xor does not have short circuit behavior -- both operands must be evaluated.
Short circuit evaluation in xor operations doesn't make any sense. Proving that
one operand is true isn't enough -- you must prove that the other operand is
false. The same is true vice versa. For &&, proving that one is false is enough,
and for ||, proving that one is true is enough. But for xor, you must always
evaluate both operands.

=end