class Image < ActiveRecord::Base
  has_attachment :content_type => :image, 
                 :storage => :file_system, 
                 :thumbnails => { :thumb => '100x100>' }
  validates_as_attachment
  
  has_many :card_images, :dependent => true
  has_many :cards, :through => :card_images
end
