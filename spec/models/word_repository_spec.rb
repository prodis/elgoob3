RSpec.describe WordRepository do
  subject { described_class }

  let(:words) do
    [
      Word.new('one', 1),
      Word.new('two', 2)
    ]
  end

  before do
    described_class.instance_variable_set(:@words, words)
  end

  after do
    described_class.instance_variable_set(:@words, [])
  end

  describe '.save' do
    context 'when word was not created' do
      let(:word) { Word.new('three', 3) }

      it 'adds word to repository' do
        subject.save(word)
        expect(subject.all.last).to eq word
      end
    end

    context 'when word was already created' do
      let(:word) { Word.new('two', 4) }

      it 'adds page ID' do
        subject.save(word)
        expect(subject.all.last.page_ids).to eq [2, 4]
      end
    end
  end

  describe '.find' do
    it 'finds word by text' do
      expect(subject.find('one')).to eq words.first
    end
  end

  describe '.all' do
    it 'returns all words' do
      expect(subject.all).to eq words
    end
  end
end
