require 'test_helper'

class SlideTest < ActiveSupport::TestCase

  context "empty card" do
    should "have position" do
      card = Factory(:card)
      slide = Factory(:slide, :card_id => card.id, :rol => 'photos')
      assert_equal 1, slide.pos
      slide2 = Factory(:slide, :card_id => card.id, :rol => 'photos')
      assert_equal 2, slide2.pos
      slide3 = Factory(:slide, :card_id => card.id, :rol => 'news')
      assert_equal 1, slide3.pos
    end
  end
end
