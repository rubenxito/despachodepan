class Color < ActiveRecord::Base

  def used?
    Card.count(:conditions => {:color_id => self.id}) > 0 || Tag.count(:conditions => {:color_id =>  self.id}) > 0
  end
end
