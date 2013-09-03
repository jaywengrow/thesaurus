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

  def initialize(args={})
    @word = args[:word]
    @synonyms = args[:synonyms]
    @antonyms = args[:antonyms]
  end

end

# Possible things TODO:
# 1. Remove entry from Thesaurus
# 2. Create a clean lookup method(s) that looks up synonyms/antonyms in the thesaurus
# 3. When creating new entries, create entries based off the entries with appropriate synonyms
# 4. Adding and removing synonyms/antonyms from entry
# 5. Better API for initializing Thesaurus. Possible example:
#    t = Thesaurus.new do
#      Entry.new("happy") do
#        synonyms ["glad", "content"]
#        antonyms ["sad", "unhappy"]
#      end
#    end