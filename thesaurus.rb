class Thesaurus

  attr_accessor :entries

  def initialize(entries={})
    @entries = entries
  end

  def <<(entry)
    @entries.merge!({entry.word => entry})
  end
end

class Entry

  attr_accessor :word, :synonyms, :antonyms

  def initialize(word, args={})
    @word = word
    @synonyms = args[:synonyms]
    @antonyms = args[:antonyms]
  end

end