class TagsController < ApplicationController
  before_filter :authenticate

  layout 'admin'
  inherit_resources

  before_filter :load_colors
  
  def index
    @tag = Tag.new
    index!
  end

  private
  def load_colors
    @colors = Color.all
  end
end
