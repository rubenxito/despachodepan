class ColorsController < ApplicationController
  layout 'admin'
  before_filter :authenticate
  inherit_resources

  def index
    @color = Color.new
    index!
  end
end
