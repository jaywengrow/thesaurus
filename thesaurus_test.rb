require 'minitest/autorun'
require_relative 'thesaurus'

class ThesaurusTest < MiniTest::Unit::TestCase

  def test_add_entry
    thesaurus = Thesaurus.new
    thesaurus << Entry.new("happy")
    assert_equal(thesaurus.entries["happy"].class, Entry)
  end

end