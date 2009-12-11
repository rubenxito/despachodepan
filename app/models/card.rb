require 'date.rb'

class Card < ActiveRecord::Base
  default_scope :order => 'updated_at DESC'
	has_many :slides, :dependent => :destroy, :order => 'pos'
	has_many :files, :class_name => 'CardFile', :dependent => :destroy
	belongs_to :main_image, :class_name => "Image",
		:foreign_key => :main_image_id,  :dependent => :destroy
	belongs_to :color
	has_and_belongs_to_many :tags
	belongs_to :main_slide, :foreign_key => :main_slide_id,
		:class_name => 'Slide'
	belongs_to :main_file, :foreign_key => :main_file_id,
		:class_name => 'CardFile'
  has_one :selection

  # VALIDATIONS
  validates_presence_of :title

  # CALLBACKS
  before_save :generate_url
  after_create :create_selection
	
	BEGIN_YEAR = 2001
	BLOCS_PER_YEAR = 16
	DAYS_PER_BLOC = 365 / 16
	
	def is_about?(tag)
		!tags.to_a.find {|t| t.id == tag.id}.nil?
	end
	
	def begin_column
		date_to_column(parse_date start)
	end
	
	def end_column
		if finish.nil? || finish.empty?
			date_to_column(Date.today)
		else		
			date_to_column(parse_date(finish)) 
		end
	end

	def column_of(str_date)
		date_to_column(parse_date(str_date))
	end
	
	def has_color
		!color.nil?
	end

  private
	def parse_date(str_date)
    a = str_date.split('/').map{|str| str.to_i}
    Date.new(a[2], a[1], a[0])
	end
	
	def date_to_column(date)
		year = date.year - BEGIN_YEAR
		offset = date.yday / DAYS_PER_BLOC
		year * BLOCS_PER_YEAR + offset
	end

  def generate_url
    if self.respond_to?(:url) && self.url.blank?
      self.url = title.downcase.gsub(' ', '-').gsub(/"/, '').gsub(/á/, 'a').
        gsub(/é/, 'e').gsub(/í/, 'i').gsub(/ó/, 'o').gsub(/ú/, 'u')
    end
  end
end
