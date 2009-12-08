class CardFile < ActiveRecord::Base
	has_attachment :storage => :file_system, :path_prefix => 'public/media/files'
	belongs_to :card
end

