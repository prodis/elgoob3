RSpec.describe Page do
  describe '.new' do
    subject { described_class }

    it 'initializes properly' do
      page = subject.new('1', 'Content here')

      expect(page.id).to eq 1
      expect(page.content).to eq ['content', 'here']
    end
  end

  describe '#save' do
    subject { described_class.new(1, 'Content here') }

    it 'saves words' do
      %w{ content here }.each do |word|
        expect(WordRepository).to receive(:save).with(word, 1)
      end

      subject.save
    end
  end
end
