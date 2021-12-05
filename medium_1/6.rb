# Original Solution

=begin
def minilang(code)
  stack = []
  register = 0
  code.split.each do |token|
    if integer?(token)
      register = token.to_i
    elsif token == 'PRINT'
      puts register
    elsif token == 'PUSH'
      stack << register
    elsif token == 'POP'
      register = stack.pop
    else
      register = send(token.downcase.to_sym, register, stack)
    end
  end
end


# Commands

def add(register_value, stack)
  register_value + stack.pop
end

def sub(register_value, stack)
  register_value - stack.pop
end

def mult(register_value, stack)
  register_value * stack.pop
end

def div(register_value, stack)
  register_value / stack.pop
end

def mod(register_value, stack)
  register_value.remainder(stack.pop)
end

def integer?(command)
  command.to_i.to_s == command
end
=end

# Better Solution

def minilang(program)
  stack = []
  register = 0
  program.split.each do |token|
    case token
    when 'ADD'   then register += stack.pop
    when 'DIV'   then register /= stack.pop
    when 'MULT'  then register *= stack.pop
    when 'MOD'   then register %= stack.pop
    when 'SUB'   then register -= stack.pop
    when 'PUSH'  then stack.push(register)
    when 'POP'   then register = stack.pop
    when 'PRINT' then puts register
    else              register = token.to_i
    end
  end
end

# Example

=begin
(3 + (4 * 5) - 7) / (5 % 3)
Must compute in the order specified by order of operations:

- Set register to 3 [] 3
- Push 3 to stack [3] 3
- Set register to 5 [3] 5
- Mod [] 2
- Push register to stack [2] 2

- Set the register to 7
- Push 7 to stack [2, 7]
- Set register to 5 [2, 7] 5
- Push 5 to stack [2, 7, 5] 5
- Set register to 4 [2, 7, 5] 4
- Multiply [2, 7] 20
- Push to stack [2, 7, 20] 20
- Set register to 3 [2, 7, 20] 3
- Add [2, 7] 23
- Subtract [2] 16
- Divide [] 8
- Print

=end

# FURTHER EXPLORATION
minilang('3 PUSH 5 MOD PUSH 7 PUSH 5 PUSH 4 MULT PUSH 3 ADD SUB DIV PRINT')

=begin
minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)
=end