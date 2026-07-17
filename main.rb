require_relative 'lib/hash_map'

test = HashMap.new

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

puts "Capacity: #{test.capacity}"
puts "Length: #{test.length}"
puts "Load level: #{test.length.to_f / test.capacity}"

test.set('jacket', 'black')
test.set('ice cream', 'pistacchio')

puts "\nUpdating values\n\n"
puts "Capacity: #{test.capacity}"
puts "Length: #{test.length}"
puts "Load level: #{test.length.to_f / test.capacity}"

test.set('moon', 'silver')

puts "\nExpanding map\n\n"
puts "Capacity: #{test.capacity}"
puts "Length: #{test.length}"
puts "Load level: #{test.length.to_f / test.capacity}"

puts "My favorite ice cream flavor: #{test.get('ice cream')}"
puts "I own a jacket: #{test.has?('jacket')}"
puts "I own pants: #{test.has?('pants')}"

test.remove('hat')
puts 'Hats off!'
puts "I own a hat: #{test.has?('hat')}"

puts "All keys: #{test.keys}"
puts "All values: #{test.values}"
puts "All entries: #{test.entries}"

test.clear

puts "\nSpring cleaning\n\n"
puts "Capacity: #{test.capacity}"
puts "Length: #{test.length}"
puts "Load level: #{test.length.to_f / test.capacity}"
