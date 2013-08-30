require 'minitest/autorun'
require_relative 'thesaurus'

class ThesaurusTest < MiniTest::Unit::TestCase

  def test_add_entry
    thesaurus = Thesaurus.new
    thesaurus << Entry.new("Happy")
    thesaurus.entries[0].word.should == "Happy"
  end

end