require 'minitest/autorun'
require_relative 'thesaurus'

class ThesaurusTest < MiniTest::Unit::TestCase

  def test_add_entry
    thesaurus = Thesaurus.new
    entry = Entry.new("happy")
    thesaurus << entry
    assert_equal(entry, thesaurus.entries["happy"])
  end

end