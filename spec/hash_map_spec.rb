require_relative '../lib/hash_map'

describe HashMap do
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

  describe '#values' do
    subject(:map_with_values) { described_class.new }
    before do
      5.times { |n| map_with_values.set(n.to_s, n) }
    end

    it 'returns an array of all values' do
      expected = [0, 1, 2, 3, 4]
      actual = map_with_values.values
      expect(actual).to match(expected)
    end
  end

  describe '#entries' do
    subject(:map_with_entries) { described_class.new }
    before do
      5.times { |n| map_with_entries.set(n.to_s, n) }
    end

    it 'returns a nested array of key, value pairs' do
      expected = [['0', 0], ['1', 1], ['2', 2], ['3', 3], ['4', 4]]
      actual = map_with_entries.entries
      expect(actual).to match(expected)
    end
  end
end
