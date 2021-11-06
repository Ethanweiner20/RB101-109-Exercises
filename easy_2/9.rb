# String Assignment

# The code prints out 'Bob', 'Alice'. 'Bob' is assigned to `name`, and `save_name` stores the reference pointing to `Bob`. When `name` is reassigned, it now stores a pointer pointing to `Alice`, but `save_name` is still pointing to `Bob`.

# The code prints out `BOB`, `BOB`, because #upcase! mutates the String object that both `name` and `save_name` are pointing to. `name` points to the object storing `Bob`, and `save_name` is assigned to that same reference. #upcase! is a mutating method, meaning it directly mutates the object stored at the reference of its caller. `name` is the caller of #upcase!, so the object referenced by `name` is mutated, which is the same object referenced by `save_name`.