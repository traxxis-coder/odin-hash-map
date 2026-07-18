require_relative 'linked_list/lib/linked_list'
require_relative 'my_hash'

class HashSet < MyHash
  def set(key)
    return if has?(key)

    @length += 1
    grow if capacity * LOAD_FACTOR < length
    buckets[hash(key) % capacity].append(key)
  end

  # def remove(key)
  #   return unless has?(key)

  #   @length -= 1
  #   buckets[hash(key) % capacity].remove_key(key)
  # end
end
