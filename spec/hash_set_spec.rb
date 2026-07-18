require_relative '../lib/hash_set'

describe HashSet do
  describe '#set' do
    subject(:setting_set) { described_class.new }
    before do
      setting_set.set('bull')
    end
    it 'places a key to to correct bucket' do
      expect(setting_set.buckets[3].head.key).to eq('bull')
    end

    it 'keeps the value as nil' do
      expect(setting_set.buckets[3].head.value).to eq(nil)
    end

    it 'increments @length' do
      expect(setting_set.length).to be 1
    end

    context 'trying to set an already existing key' do
      before do
        setting_set.set('bull')
      end

      it 'still contains the key in the correct bucket' do
        expect(setting_set.buckets[3].head.key).to eq('bull')
      end

      it 'doesn\'t change length' do
        expect(setting_set.length).to be 1
      end
    end

    context 'adding a new key' do
      before do
        setting_set.set('horse')
      end

      it 'sets another key in the right bucket' do
        expect(setting_set.buckets[13].head.key).to eq('horse')
      end

      it 'increments @length' do
        expect(setting_set.length).to be 2
      end
    end

    context 'resolving a collision' do
      before do
        setting_set.set('rar')
      end

      it 'appends the new key to the correct bucket' do
        expect(setting_set.buckets[3].head.next_node.key).to eq('rar')
      end

      it 'increments @length' do
        expect(setting_set.length).to be 2
      end
    end
  end
end
