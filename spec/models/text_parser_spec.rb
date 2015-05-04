RSpec.describe TextParser do
  describe '#words' do
    let(:text) { '- Elementary, dear Watson?! (or not, dear Watson) 123' }
    let(:words) { %w{ elementary dear watson or not } }

    it 'parses text to words' do
      expect(subject.words(text)).to eq words
    end
  end
end
