class SelectionsController < ApplicationController
  layout 'admin'
  before_filter :authenticate
  inherit_resources

  actions :all, :except => [:new]

  def index
    @selections = Selection.active
    index!
  end

  def show
    @selection = Selection.find(params[:id])
    if @selection.active?
      render :action => 'edit'
    else
      redirect_to @selection.card
    end
  end
end

