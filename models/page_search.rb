class PageSearch
  def search(query)
    query_words = text_parser.words(query)
    return [] if query_words.empty?

    page_ids = query_words.map { |word| Word.all[word] }.compact.flatten
    return [] if page_ids.empty?

    page_count = Hash.new(0)
    page_ids.each { |id| page_count[id] += 1 }

    result = page_count.map { |id, score| { pageId: id, score: score } }
    result.sort { |a, b| b[:score] <=> a[:score] }
  end

  private

  def text_parser
    @text_parser ||= TextParser.new
  end
end
