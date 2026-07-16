require_relative 'linked_list/lib/linked_list'

# creates a HashMap - an array with a given number of slots assigned key, value pairs
# based on a hash number calculated from the key
# when the HashMap is almost full, it expands to maximize speed while minimizing memory requirements
class HashMap
  LOAD_FACTOR = 0.75

  attr_reader :buckets, :capacity, :length

  # creates an empty HashMap with a capacity of 16
  # to handle collisions, each item of the HashMap is an empty LinkedList
  def initialize(capacity = 16)
    @capacity = capacity
    @length = 0
    @buckets = Array.new(capacity) { LinkedList.new }
  end

  # produces a hash code based on the enterred key
  def hash(key)
    hash_code = 0
    prime = 31

    key.each_char { |char| hash_code = hash_code * prime + char.ord }

    hash_code
  end

  # saves a key, value pair into a place chosen based on the hash method
  # reassigns value for an already existing key
  # needs to also check if the HashMap needs to grow
  def set(key, value)
    if has?(key)
      buckets[hash(key) % capacity].update(key, value)
    else
      buckets[hash(key) % capacity].append(key, value)
    end
  end

  # returns the value assigned to the key, or nil if the key doesn't exist
  def get(key)
    buckets[hash(key) % capacity].each { |node| return node.value if node.key == key }
  end

  # returns true if the HashMap includes the given key, false otherwise
  def has?(key)
    buckets[hash(key) % capacity].each { |node| return true if node.key == key }

    false
  end

  # removes the corresponding key, value pair
  def remove(key)
  end

  # removes all key, value pairs from the HashMap
  def clear
  end

  # returns an array of all keys in the HashMap
  def keys
  end

  # returns an array of all values in the HashMap
  def values
  end

  # returns a nested array of all key, value oairs in the HashMap
  def entries
  end

  # performs the growth process of the HashMap
  # expands the array to double its size and reallocates the key, value pairs to be spread evenly
  def grow
  end
end
