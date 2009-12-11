class Selection < ActiveRecord::Base
  belongs_to :card
  belongs_to :image

  named_scope :active, :conditions => {:active => true}

  TOP = 'top'
  BOTTOM = 'bottom'

  validates_presence_of :card

  # callbacks
  before_create :set_position

  private
  def set_position
    self.position = Selection::TOP
  end

end
