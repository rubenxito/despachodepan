require 'test_helper'

class SelectionTest < ActiveSupport::TestCase
  context "selection scopes" do
    should "select all active" do
      Factory(:card)
      Factory(:card)
      Factory(:card)
      assert_equal 3, Selection.all.size
      assert_equal 0, Selection.active.size
      Card.last.selection.update_attribute(:active, true)
      assert_equal 1, Selection.active.size
    end
  end

  context "empty selection" do
    should "have default position" do
      card = Factory(:card)
      assert_equal Selection::TOP, card.selection.position
    end
  end


end
