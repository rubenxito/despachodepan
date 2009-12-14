class Image < ActiveRecord::Base
  has_attachment :content_type => :image, 
                 :storage => :file_system,
                 :path_prefix => 'public/media/images',
                 :thumbnails => { :thumb => '100x100>' }

  validates_as_attachment
  
  has_many :slides, :dependent => :destroy
  has_many :cards, :through => :slides
end
