require 'minitest/autorun'
require_relative 'thesaurus'

class ThesaurusTest < MiniTest::Unit::TestCase

  def test_add_entry
    thesaurus = Thesaurus.new
    thesaurus << Entry.new
    assert_equal(thesaurus.entries[0].class, Entry)
  end

end