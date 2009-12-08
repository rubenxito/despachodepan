class CardFile < ActiveRecord::Base
	has_attachment :storage => :file_system, :path_prefix => 'public/files'
	belongs_to :card
end

