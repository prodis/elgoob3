RSpec.describe Word do
  subject { described_class }

  describe '.new' do
    it 'initializes properly' do
      word = subject.new('text', 1)

      expect(word.text).to eq 'text'
      expect(word.page_ids).to eq [1]
    end
  end

  describe '.all' do
    let(:words) do
      [
        subject.new('one', 1),
        subject.new('two', 2)
      ]
    end

    it 'returns all words from repository' do
      allow(WordRepository).to receive(:all).and_return(words)
      expect(subject.all).to eq words
    end
  end

  describe '#save' do
    subject { described_class.new('text', 1) }

    it 'saves in repository' do
      expect(WordRepository).to receive(:save).with(subject)
      subject.save
    end
  end
end
