class Tag < ActiveRecord::Base
	has_and_belongs_to_many :cards
	acts_as_list :column => 'position'
	belongs_to :color
	
	
end
