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

# Possible things TODO:
# 1. Add method to Thesaurus that removes entries from the Thesaurus
# 2. Add methods to Entry that add more synonyms/antonyms to an existing Entry.
# 3. As of now, the only way to look up synonyms in the thesaurus is thesaurus.entries["happy"].synonyms. Create a cleaner lookup method(s) that looks up synonyms/antonyms in the thesaurus.
# 4. When creating new entries, create mirror entries based on synonyms. For example, if we add to a thesaurus an Entry for "happy" that has a synonym for "glad", that should automatically create an entry for "glad" that has a synonym "happy".
# 5. Develop a cleaner API for initializing Thesaurus. Possible example:
#    t = Thesaurus.new do
#      Entry.new("happy") do
#        synonyms ["glad", "content"]
#        antonyms ["sad", "unhappy"]
#      end
#    end