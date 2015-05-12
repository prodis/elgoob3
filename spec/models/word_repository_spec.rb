RSpec.describe WordRepository do
  subject { described_class }

  let(:words) do
    {
      'one' => [1],
      'two' => [2]
    }
  end

  before do
    described_class.instance_variable_set(:@words, words)
  end

  after do
    described_class.instance_variable_set(:@words, {})
  end

  describe '.save' do
    context 'when word was not created' do
      let(:word) { Word.new('three', 3) }

      it 'adds word to repository' do
        subject.save(word)
        expect(subject.all['three']).to eq [3]
      end
    end

    context 'when word was already created' do
      let(:word) { Word.new('two', 4) }

      it 'adds page ID' do
        subject.save(word)
        expect(subject.all['two']).to eq [2, 4]
      end
    end
  end

  describe '.all' do
    it 'returns all words' do
      expect(subject.all).to eq words
    end
  end
end
