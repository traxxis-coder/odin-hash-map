require_relative '../lib/hash_map'

describe HashMap do
  describe '#initialize' do
    subject(:new_hash_map) { described_class.new }
    it 'creates an array of length 16' do
      expect(new_hash_map.buckets.size).to eq(16)
    end

    it 'creates a "capacity" variable set to 16' do
      expect(new_hash_map.capacity).to eq(16)
    end

    it 'creates a "length" variable set to 0' do
      expect(new_hash_map.length).to eq(0)
    end
  end

  describe '#hash' do
    subject(:hashing_map) { described_class.new }
    it 'correctly transforms a given key into a number' do
      expected = 99_162_322
      actual = hashing_map.hash('hello')
      expect(actual).to eq(expected)
    end
  end

  describe '#set' do
    subject(:setting_map) { described_class.new }
    before do
      setting_map.set('a', 'Albert')
    end

    context 'when adding a new key' do
      it 'places a key, value pair in the correct bucket' do
        expect(setting_map.buckets[1].head.value).to eq('Albert')
      end

      it 'increments @length for new bucket' do
        expect(setting_map.length).to eq(1)
      end
    end

    context 'when resolving a collision' do
      before do
        setting_map.set('q', 'Quentin')
      end
      it 'adds the node to the list at index for a different key leading to the same bucket' do
        expect(setting_map.buckets[1].head.next_node.value).to eq('Quentin')
      end

      it 'increments @length' do
        expect(setting_map.length).to eq(2)
      end
    end

    context 'when updating an existing key' do
      before do
        setting_map.set('a', 'Alphonse')
      end
      it 'updates the value of the node with the given key' do
        expect(setting_map.buckets[1].head.value).to eq('Alphonse')
      end

      it 'doesn\'t increment @length' do
        expect(setting_map.length).to eq(1)
      end
    end

    context 'when adding the 13th node' do
      before do
        11.times { |n| setting_map.set(n.to_s, n) } # the setting_map already has 1 node from another before block
      end
      it 'triggers the #grow method' do
        expect(setting_map).to receive(:grow)
        setting_map.set('g', 'Ginny')
      end
    end
  end

  describe '#get' do
    subject(:getting_map) { described_class.new }
    before do
      getting_map.set('d', 'Derrek')
    end

    it 'returns the value of a node with the key' do
      expect(getting_map.get('d')).to eq('Derrek')
    end

    it 'returns nil if the HashMap desn\'t have the key' do
      expect(getting_map.get('e')).to be nil
    end
  end

  describe '#has?' do
    subject(:has_map) { described_class.new }
    before do
      has_map.set('b', 'Billiam')
    end
    it 'returns true if HashMap has the key' do
      expect(has_map.has?('b')).to be true
    end

    it 'returns false if HashMap doesn\'t have the key' do
      expect(has_map.has?('x')).to be false
    end
  end

  describe '#remove' do
    subject(:removing_map) { described_class.new }
    before do
      removing_map.set('f', 'Fiona')
    end

    it 'removes the node with the given key' do
      removing_map.remove('f')
      expect(removing_map.has?('f')).to be false
    end

    it 'returns the value of the removed node' do
      expect(removing_map.remove('f')).to eq('Fiona')
    end

    it 'decrements @length' do
      removing_map.remove('f')
      expect(removing_map.length).to eq(0)
    end
  end

  describe '#grow' do
    subject(:growing_map) { described_class.new }
    before do
      # #grow is called implicitly in the 13th #set method call as tested above
      13.times { |n| growing_map.set(n.to_s, n) }
    end

    it 'doubles the current capacity' do
      expect(growing_map.capacity).to eq(32)
    end

    it 'creates a new array double the size of the original' do
      expect(growing_map.buckets.size).to eq(32)
    end

    it 'reassigns nodes to new buckets evenly' do
      expect(growing_map.buckets[17].head.value).to eq(1)
    end
  end
end
