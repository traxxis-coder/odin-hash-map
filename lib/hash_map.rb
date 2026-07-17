require_relative 'my_hash'

# creates a HashMap - an array with a given number of slots assigned key, value pairs
# based on a hash number calculated from the key
# when the HashMap is almost full, it expands to maximize speed while minimizing memory requirements
class HashMap < MyHash
  # returns the value assigned to the key, or nil if the key doesn't exist
  def get(key)
    buckets[hash(key) % capacity].each { |node| return node.value if node.key == key }
  end

  # returns an array of all values in the HashMap
  def values
    values = []
    buckets.each { |list| list.each { |node| values << node.value } }
    values
  end

  # returns a nested array of all key, value oairs in the HashMap
  def entries
    entries = []
    buckets.each { |list| list.each { |node| entries << [node.key, node.value] } }
    entries
  end
end
