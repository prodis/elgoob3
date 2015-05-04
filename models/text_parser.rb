class TextParser
  def words(text)
    text = text.to_s.downcase
    text = remove_punctuation(text)
    text.split.uniq
  end

  private

  def remove_punctuation(text)
    text.gsub(/[^a-z ]/, '')
  end
end
