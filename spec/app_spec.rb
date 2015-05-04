RSpec.describe 'Application' do
  describe 'GET search' do
    context 'when query is supplied' do
      let(:search_result) do
        [
          { pageId: 300, score: 3 },
          { pageId: 12, score: 1 }
        ]
      end
      let(:matches) do
        {
          matches: search_result
        }
      end
      let(:query) { 'Elementary, dear Watson' }

      before do
        allow_any_instance_of(PageSearch).to receive(:search).with(query).and_return(search_result)
        get "/search?query=#{query}"
      end

      it 'response is OK' do
        expect(last_response).to be_ok
      end

      it 'returns matches' do
        expect(last_response.body).to eq(matches.to_json)
      end
    end

    context 'when query is not supplied' do
      before { get '/search' }

      it 'response is OK' do
        expect(last_response).to be_ok
      end

      it 'returns no matches' do
        expect(last_response.body).to eq({ matches: [] }.to_json)
      end
    end
  end

  describe 'POST index' do
    context 'when payload is not empty' do
      let(:page_data) do
        {
          pageId: 300,
          content: 'Elementary, dear Watson'
        }
      end

      before { post '/index', page_data.to_json }

      it 'saves page content' do
        expected_words = %w{ elementary dear watson }

        Word.all.each do |word|
          expect(expected_words).to include(word.text)
          expect(word.page_ids).to eq [300]
        end
      end

      it 'response is 204 No Content' do
        expect(last_response.status).to eq 204
      end
    end

    context 'when payload is empty' do
      it 'response is 400 Bad Request' do
        post '/index'
        expect(last_response.status).to eq 400
      end
    end
  end
end
