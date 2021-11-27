# Grocery List

def buy_fruit(grocery_list)
  grocery_list.map { |grocery| list(grocery[0], grocery[1]) }.flatten
end

def list(fruit, quantity)
  Array.new(quantity, fruit)
end

puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]