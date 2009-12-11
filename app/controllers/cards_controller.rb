class CardsController < ApplicationController
  layout 'admin'
  before_filter :authenticate
  inherit_resources

  def index
    @cards = Card.all(:include => [:color, :main_image, :main_slide, :tags, :selection])
    index!
  end

  def new
    card = Card.create(:title => 'ficha sin título')
    redirect_to edit_card_path(card)
  end

  def show
    redirect_to :action => 'edit'
  end

  def edit
    @tags = Tag.all
    @slide = Slide.new
    @card_file = CardFile.new
    edit!
  end
end
