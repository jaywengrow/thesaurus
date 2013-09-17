class Thesaurus

  attr_accessor :entries

  def initialize(entries={})
    @entries = entries
  end

  def <<(entry)
    @entries.merge!({entry.word => entry})
  end

  def create_mirror_entries(word)
    synonyms(word).each do |synonym|
      if exists?(synonym)
        @entries[synonym].add_synonym(word) if !synonyms(synonym).include?(word)
      else #doesn't exist
        self << Entry.new(synonym, {:synonyms => ([word] + synonyms(word) - [synonym])})
        # create_mirror_entries(synonym)
      end
    end
  end

  def delete_entry(word)
    @entries[word] = nil if @entries[word]
  end

  def synonyms(word)
    @entries[word].synonyms
  end

  def exists?(word)
    !@entries[word].nil?
  end

end

class Entry

  attr_accessor :word, :synonyms, :antonyms

  def initialize(word, args={})
    @word = word
    @synonyms = args[:synonyms] || []
    @antonyms = args[:antonyms] || []
  end

  def add_synonym(word)
    @synonyms << word
  end



end

# Possible things TODO:
# 1. Add method to Thesaurus that removes entries from the Thesaurus
# 2. Add methods to Entry that add more synonyms/antonyms to an existing Entry.
# 3. As of now, the only way to look up synonyms in the thesaurus is thesaurus.entries["happy"].synonyms. Create a cleaner lookup method(s) that looks up synonyms/antonyms in the thesaurus.
# 4. When creating new entries, create mirror entries based on synonyms. For example, if we add to a thesaurus an Entry for "happy" that has a synonym "glad", that should automatically create an entry for "glad" that has a synonym "happy".
# Edge cases: 1) Ideally, this should work when adding an entry with multiple synonyms. 2) If one of the mirror entries already exist, it should just add the new synonyms and not create a new entry.
# 5. Develop a cleaner API for initializing Thesaurus. Possible example:
#    t = Thesaurus.new do
#      Entry.new("happy") do
#        synonyms ["glad", "content"]
#        antonyms ["sad", "unhappy"]
#      end
#    end