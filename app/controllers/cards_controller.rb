class CardsController < ApplicationController
  layout 'admin'
  before_filter :authenticate
  inherit_resources

  def find
    redirect_to Card.find_by_url(params[:id])
  end

  def index
    @cards = Card.all(:include => [:color, :main_image, :main_slide, :tags])
    index!
  end

  def new
    card = Card.create(:title => 'ficha sin título')
    expire_cache(card)
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
      end
      @card.touch
      expire_cache(@card)
      redirect_to edit_card_path(@card)
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
    @card = Card.find(params[:id]) if @card.nil?
    @tags = Tag.all
    @colors = Color.all
    @photo = @card.slides.build(:rol => 'slide')
    @news = @card.slides.build(:rol => 'news')
    @selected = @card.slides.build(:rol => 'selection')
    @card_file = CardFile.new
  end

  def expire_cache(card)
    expire_page :controller => 'pages', :action => 'card', :id => card.url
    [:index, :indice, :lapanaderia, :selection, :actual].each do |action|
      expire_page :controller => 'pages', :action => action.to_s
    end

    card.photos.each do |slide|
      expire_page :controller => 'pages', :action => 'thumb', :id => slide.id
    end
  end

end
