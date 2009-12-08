class CardsController < ApplicationController
  layout 'admin'
  inherit_resources

  def new
    @tags = Tag.all
    new!
  end

  def edit
    @tags = Tag.all
    @slide = Slide.new
    edit!
  end
end
