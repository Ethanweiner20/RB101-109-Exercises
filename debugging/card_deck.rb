# Card Deck

# Part 1

=begin

The code raises a typerror because of lines 34. The block local variable
`remaining_cards` is an array of cards, which consists of integers and symbols.
The `map` method invocation does not destructively mutate the array referenced
by `remaining_cards`, and no reassignment to `remaining_cards` occurs.
Therefore, on line 34, the value of `remaining_cards` is still an array of
integers and symbols. Array#sum expects only integer elements in its caller
array, so upon encountering symbols it will raise a TypeError.

The fix to this could be to reassign the return value of `map` to a new local
variable, on which #sum is called.

=end

# Part 2

=begin

- Each hash key is assigned to the same value
- [Randomly picking cards] A card is popped from `cards`, which *every suit*
points to

The purpose of lines 20 to 25 is to pick one random card per suit. However, 4
random cards are chosen (and removed from the deck) per suit.

There are 4 keys in `deck`, so the `each` call on `deck.keys` results in 4 
iterations. On each iteration, the `cards` for the particular suit are assigned
to the return value of `deck[suit]`. The array returned by `deck[suit]` is the same object for all
4 suits, because the initialization of `deck` on lines 3-6 assigned each suit
key to the same object, the array referenced by`cards`. Therefore, the `cards` local variable
on line 22 points to the same array for each iteration. `pop` is invoked on
`cards` for each iteration, so 4 elements are removed from this array.

Now the entire `deck` contains 16 less total cards, because there are 4 suits, and each
suit contained the same cards array from which 4 elements are removed. Therefore,
when summing the remaining cards in the `deck`, the sum will be lower than expected.

=end