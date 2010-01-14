class PositionsController < ApplicationController
  before_filter :authenticate
  before_filter :load_model

  def top
    @model.move_to_top
    redirect_to model_path
  end

  def up
    @model.move_higher
    redirect_to model_path
  end

  def down
    @model.move_lower
    redirect_to model_path
  end

  def bottom
    @model.move_to_bottom
    redirect_to model_path
  end

  protected
  def model_path
  end

  def load_model
  end

  
end
