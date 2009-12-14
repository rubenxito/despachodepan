class CardsController < ApplicationController
  layout 'admin'
  before_filter :authenticate
  inherit_resources

  def index
    @cards = Card.all(:include => [:color, :main_image, :main_slide, :tags])
    index!
  end

  def new
    card = Card.create(:title => 'ficha sin título')
    redirect_to edit_card_path(card)
  end

  def update
    @card = Card.find(params[:id])
    if @card.update_attributes(params[:card])
      flash[:notice] = 'Bien!! Ficha guardada!'
      if data?(:selection_image_data)
        @card.selection_image.destroy if @card.selection_image
        image = Image.create(:uploaded_data => params[:selection_image_data])
        @card.update_attribute(:selection_image_id, image.id)
        redirect_to edit_card_path(@card)
      end
    else
      prepare_edit
      render :action => 'edit'
    end
  end

  def show
    redirect_to :action => 'edit'
  end

  def edit
    prepare_edit
    edit!
  end

  private
  def prepare_edit
    @tags = Tag.all
    @colors = Color.all
    @slide = Slide.new
    @card_file = CardFile.new
  end

  def data?(name)
    !params[name].nil? && params[name].size > 0
  end
end
