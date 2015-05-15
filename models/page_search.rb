class PageSearch
  def search(query)
    query_words = text_parser.words(query)
    return [] if query_words.empty?

    scores = query_words.inject({}) do |words_result, word|
      page_ids = WordRepository.all[word] || []

      page_ids.inject(words_result) do |ids_result, id|
        ids_result[id] = ids_result[id].to_i + 1
        ids_result
      end
    end

    format(scores)
  end

  private

  def format(scores)
    return [] if scores.empty?

    result = scores.map { |id, score| { pageId: id, score: score } }
    result.sort { |a, b| b[:score] <=> a[:score] }
  end

  def text_parser
    @text_parser ||= TextParser.new
  end
end
