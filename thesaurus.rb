class Thesaurus

  def initialize(entries=[])
    @entries = entries
  end

  def <<(entry)
    @entries << entry
  end
end

class Entry

  def initialize(word)
    @word = word
  end

end