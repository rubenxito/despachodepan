class CardFilesController < ApplicationController
  layout 'admin'
  before_filter :authenticate
  inherit_resources
  actions :all, :except => [:show]
  belongs_to :card


  def index
    redirect_to Card.find(params[:card_id])
  end

  def create
    create! do |success, failure|
      success.html {redirect_to @card_file.card}
    end
  end

  def update
    update! do |success, failure|
      success.html {redirect_to @card_file.card}
    end
  end


  def destroy
    file = CardFile.find(params[:id])
    file.destroy if file.filename
    file.delete unless file.filename
    flash[:notice] = t('flash.card_files.destroy.notice')
    redirect_to file.card
  end
  
end
