class ColorsController < ApplicationController
  layout 'admin'
  before_filter :authenticate
  inherit_resources

  def index
    @color = Color.new
    index!
  end


  def create
    create! do |success, failure|
      success.html {redirect_to colors_path}
    end
  end

  def update
    update! do |success, failure|
      success.html {redirect_to colors_path}
    end
  end

end
