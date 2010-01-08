class SlidePositionsController < ApplicationController
  before_filter :authenticate
  before_filter :load_slide

  def up
    @slide.move_higher
    redirect_to @card
  end

  def down
    @slide.move_lower
    redirect_to @card
  end

  private
  def load_slide
    @slide = Slide.find(params[:slide_id])
    @card = @slide.card
  end
end
