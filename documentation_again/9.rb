require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# According to the Ruby docs, the YAML class is an alias for the "Psych" class, which includes a method ::load_file. In essence, this acts as YAML's YAML::load_file method.