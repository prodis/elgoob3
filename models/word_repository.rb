module WordRepository
  class << self
    def save(word)
      word_found = find(word.text)

      if word_found
        word_found.page_ids += word.page_ids
        word_found.page_ids.uniq!
      else
        words << word
      end

      true
    end

    def find(text)
      words.select { |word| word.text == text }.first
    end

    def all
      words
    end
  end

  module InMemory
    private

    def words
      @words ||= []
    end
  end

  extend InMemory
end
