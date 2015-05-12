module WordRepository
  class << self
    def save(word)
      if words[word.text]
        words[word.text] += word.page_ids
        words[word.text].uniq!
      else
        words[word.text] = word.page_ids
      end

      true
    end

    def all
      words
    end
  end

  module InMemory
    private

    def words
      @words ||= {}
    end
  end

  extend InMemory
end
