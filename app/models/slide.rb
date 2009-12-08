
class Slide < ActiveRecord::Base
	belongs_to :card
	belongs_to	:image
	acts_as_list :column => 'pos', :scope => :card
end

