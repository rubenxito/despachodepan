require 'test_helper'

class CardTest < ActiveSupport::TestCase
  context "empty card" do
    should "have inactive selection" do
      card = Factory.create(:card)
      assert_not_nil card.selection
      assert_equal false, card.selection.active?
    end
  end
end