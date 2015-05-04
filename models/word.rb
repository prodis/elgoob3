class Word
  attr_accessor :text, :page_ids

  def initialize(text, page_id)
    @text = text
    page_ids << page_id
  end

  def page_ids
    @page_ids ||= []
  end

  def self.all
    WordRepository.all
  end

  def save
    WordRepository.save(self)
  end
end
