
require_relative 'convert'

def greet(name)
  puts "Hi #{name}! Welcome to Dudley's Pig Emporkium"
end

puts Converter.new(4).to_base(2)
puts Converter.new(15).to_base(16)
puts Converter.new(123).to_base(10)
