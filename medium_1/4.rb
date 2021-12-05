# 1000 Lights

# Soliution 1: Using an array to store on lights

def lights_on(n)
  1.upto(n).each_with_object([]) { |round, lights| toggle!(lights, round, n) }
end

def toggle!(lights, round, n)
  light_to_toggle = round
  until light_to_toggle > n
    toggle_light!(light_to_toggle, lights)
    light_to_toggle += round
  end
end

def toggle_light!(light, lights)
  if lights.include?(light)
    lights.delete(light)
  else
    lights << light
  end
end

puts lights_on(5) == [1, 4]
puts lights_on(10) == [1, 4, 9]

# Solution 2: Using a hash to store all lights

def lights_on_v2(n)
  hsh = 1.upto(n).each_with_object(Hash.new(false)) do |round, lights|
    toggle_v2!(lights, round, n)
  end
  hsh.select { |_, switch| switch == true }.keys
end

def toggle_v2!(lights, round, n)
  light_to_toggle = round
  until light_to_toggle > n
    lights[light_to_toggle] = !lights[light_to_toggle]
    light_to_toggle += round
  end
end

puts lights_on_v2(5) == [1, 4]
puts lights_on_v2(10) == [1, 4, 9]
puts lights_on(100)