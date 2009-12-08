class ColorsController < ApplicationController
  layout 'admin'
  inherit_resources

  def index
    @color = Color.new
    index!
  end
end
