class TagsController < ApplicationController
  before_filter :authenticate

  layout 'admin'
  inherit_resources

  before_filter :load_colors
  
  def index
    @tag = Tag.new
    index!
  end

  def create
    create! do |success, failure|
      success.html {redirect_to tags_path}
    end
  end

  def update
    update! do |success, failure|
      success.html {redirect_to tags_path}
    end
  end

  private
  def load_colors
    @colors = Color.all
  end
end
