require 'active_record/query_cache'

class CardImage < ActiveRecord::Base
	belongs_to :card
	belongs_to	:image
	acts_as_list :column => 'pos', :scope => :card
end

