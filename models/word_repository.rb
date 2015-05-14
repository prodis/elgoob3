module WordRepository
  class << self
    def save(word, page_id)
      if words[word]
        words[word] << page_id
        words[word].uniq!
      else
        words[word] = [page_id]
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
