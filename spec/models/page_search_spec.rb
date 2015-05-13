RSpec.describe PageSearch do
  before do
    Page.new(1, 'Elementary, dear Watson').save
    Page.new(2, 'The quick brown fox jumped over the lazy dog.').save
    Page.new(3, 'The wheels on the bus go round and round.').save
  end

  after do
    WordRepository.instance_variable_set(:@words, {})
  end

  describe '#search' do
    let(:words) { %w{ the quick cat jumped unkown } }
    let(:query) { words.join(' ') }
    let(:expected_result) do
      [
        { pageId: 2, score: 3},
        { pageId: 3, score: 1}
      ]
    end

    it 'returns pages IDs ordered by score' do
      expect(subject.search(query)).to eq expected_result
    end

    context 'when words are not supplied' do
      it 'returns empty result' do
        expect(subject.search('')).to be_empty
      end
    end
  end
end
