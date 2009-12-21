require 'test_helper'

class CardTest < ActiveSupport::TestCase
  context "empty card" do
    should "create cards" do
      card = Factory.create(:card)
    end
  end
end