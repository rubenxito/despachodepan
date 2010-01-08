class PagesController < ApplicationController

  caches_page :index, :indice, :lapanaderia, :card, :selection, :actual, :thumb

	def index
		prepare_index(2000)
	end

	def indice
		prepare_index(0)
	end

  def lapanaderia
    prepare_card(Card.find(1))
  end

	def card
		prepare_card(Card.find_by_url(params[:id]))
  end

  def selection
    @selection = SelectionCard.new
    render :action => 'selection', :layout => 'grids'
  end

  def actual
    @actual = Actual.new
    render :action => 'actual', :layout => 'grids'
  end

	def thumb
		@slide = Slide.find(params[:id])
		render :action => 'thumb', :layout => false
	end

  private
	def prepare_index(time)
    @scroll_time = time
		@cards = Card.find(:all)
		@tags = Tag.find(:all, :order => 'position')
    render :action => 'index', :layout => 'grids'
	end

  def prepare_card(card)
    @card = card
		if !@card.link.blank?
			redirect_to @card.link
		elsif !@card.main_file.nil?
			redirect_to @card.main_file.public_filename
		else
			@properties = []
			@card.properties.each_line do |line|
				splitted = line.split(%r{:\s})
				splitted[0], splitted[1] = '', splitted[0] if splitted.length == 1
				@properties << splitted
			end

			first = @card.slides.first
			first_id = first.nil? ? '0' : first.id
			@show_image = params[:imagen].blank? ? first_id.to_s : params[:imagen]
			render :action => 'card', :layout => 'cards'
		end
	end
end
