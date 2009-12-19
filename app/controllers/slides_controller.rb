class SlidesController < ApplicationController
  layout 'admin'
  before_filter :authenticate
  inherit_resources
  actions :all, :except => [:new]

  def create
    create! do |success, failure|
      success.html do
        save_image
        redirect_to @slide.card
      end
      failure.html { render :text => 'lo siento, algo ha ido mal. vuelve a intentarlo...'}
    end
  end

  def update
    update! do |success, failure|
      success.html do
        save_image
        redirect_to @slide.card
      end
    end
  end

  private
  def save_image
    if data?(:photo_data)
      @slide.image.destroy if @slide.image
      image = Image.create(:uploaded_data => params[:photo_data])
      @slide.update_attribute(:image_id, image.id)
    end
  end

end
