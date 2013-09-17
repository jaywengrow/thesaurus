require 'minitest/autorun'
require_relative 'thesaurus'

class ThesaurusTest < MiniTest::Unit::TestCase

  def test_add_entry
    thesaurus = Thesaurus.new
    thesaurus << Entry.new("happy")
    assert_equal(Entry, thesaurus.entries["happy"].class)
  end

  def test_delete_entry
    thesaurus = Thesaurus.new
    thesaurus << Entry.new("happy")
    thesaurus.delete_entry("happy")
    assert_equal(nil, thesaurus.entries["happy"])
  end

  def test_synonyms
    thesaurus = Thesaurus.new
    entry = Entry.new("happy", :synonyms => ["glad"])
    thesaurus << entry
    assert_equal(entry.synonyms, thesaurus.synonyms("happy"))
  end

  def test_exists?
    thesaurus = Thesaurus.new
    entry = Entry.new("happy", :synonyms => ["glad"])
    assert_equal(false, thesaurus.exists?("happy"))
  end

  def test_create_mirror_entries
    thesaurus = Thesaurus.new
    entry = Entry.new("happy", {:synonyms => ["glad"]})
    thesaurus << entry
    thesaurus.create_mirror_entries("happy")
    assert_equal(["happy"], thesaurus.synonyms("glad"))
  end

  def test_creating_mirror_entry_with_multiple_synonyms
    thesaurus = Thesaurus.new
    entry = Entry.new("happy", {:synonyms => ["glad", "gleeful"]})
    thesaurus << entry
    thesaurus.create_mirror_entries("happy")
    assert_equal(["happy", "gleeful"], thesaurus.synonyms("glad"))
  end

  def test_creating_mirror_entry_with_existing
    thesaurus = Thesaurus.new
    entry = Entry.new("happy", {:synonyms => ["glad"]})
    entry2 = Entry.new("glad", {:synonyms => ["gleeful"]})
    thesaurus << entry
    thesaurus << entry2
    thesaurus.create_mirror_entries("happy")
    assert_equal(["gleeful", "happy"], thesaurus.synonyms("glad"))
  end

  def test_easy_add_entry
    t = Thesaurus.new do
      entry "happy" do
        synonyms ["glad", "content"]
        # antonyms ["sad", "unhappy"]
      end
    end
    assert_equal(3, t.entries.length)
  end

  def test_easy_add_multiple_entries
    t = Thesaurus.new do
      entry "happy" do
        synonyms ["glad", "content"]
        # antonyms ["sad", "unhappy"]
      end

      entry "sad" do
        synonyms ["unhappy", "mad"]
        # antonyms ["sad", "unhappy"]
      end
    end
    assert_equal(6, t.entries.length)
  end

end

class EntryTest < MiniTest::Unit::TestCase

  def test_add_synonym
    entry = Entry.new("apartments", {:synonyms => ["condominium"]})
    entry.add_synonym("house")
    assert_equal(entry.synonyms.last, "house")
  end

  def test_easy_add_entry
    e = Entry.new("happy") do
      synonyms ["glad", "content"]
      # antonyms ["sad", "unhappy"]
    end
    assert_equal(["glad", "content"], e.synonyms)
  end

  def test_add_synonyms
    entry = Entry.new("apartments")
    entry.add_synonyms(["condos"])
    assert_equal(["condos"], entry.synonyms)
  end

end