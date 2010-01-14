
class TagPositionsController < PositionsController


  protected
  def model_path
    tags_path
  end
  
  def load_model
    @model = Tag.find(params[:tag_id])
  end
end
