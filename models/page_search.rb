class PageSearch
  def search(query)
    query_words = text_parser.words(query)
    return [] if query_words.empty?

    found_words = Word.all.select { |word| query_words.include?(word.text) }
    return [] if found_words.empty?

    page_ids = found_words.map { |word| word.page_ids }.flatten

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
