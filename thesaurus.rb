class Thesaurus

  attr_accessor :entries

  def initialize(entries=[])
    @entries = entries
  end

  def <<(entry)
    @entries << entry
  end
end

class Entry

  attr_accessor :word, :synonyms, :antonyms

  def initialize(args={})
    @word = args[:word]
    @synonyms = args[:synonyms]
    @antonyms = args[:antonyms]
  end

end