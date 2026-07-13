require_relative 'linked_list/lib/linked_list'

# creates a HashMap - an array with a given number of slots assigned key, value pairs
# based on a hash number calculated from the key
# when the HashMap is almost full, it expands to maximize speed while minimizing memory requirements
class HashMap
  LOAD_FACTOR = 0.75

  # creates an empty HashMap with a capacity of 16
  # to handle collisions, each item of the HashMap is an empty LinkedList
  def initialize
  end

  # produces a hash code based on the enterred key
  def hash(key)
  end

  # saves a key, value pair into a place chosen based on the hash method
  # needs to also check if the HashMap needs to grow
  def set(key, value)
  end

  # returns the value assigned to the key, or nil if the key doesn't exist
  def get(key)
  end

  # returns true if the HashMap includes the given key, false otherwise
  def has?(key)
  end

  # removes the corresponding key, value pair
  def remove(key)
  end

  # returns the number of key, value pairs in the HashMap
  # probably make it an instance variable instead
  def length
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
