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
      it 'adds word to repository' do
        subject.save('three', 3)
        expect(subject.all['three']).to eq [3]
      end
    end

    context 'when word was already created' do
      it 'adds page ID' do
        subject.save('two', 4)
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
