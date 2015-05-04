class Page
  attr_accessor :id, :content

  def initialize(id, content)
    @id = id.to_i
    @content = text_parser.words(content)
  end

  def save
    content.each do |word|
      Word.new(word, id).save
    end
  end

  private

  def text_parser
    @text_parser ||= TextParser.new
  end
end
