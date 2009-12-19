
class Slide < ActiveRecord::Base
	belongs_to :card
	belongs_to	:image
	acts_as_list :column => 'pos'

  validates_presence_of :rol, :card_id

  named_scope :selected, :conditions => {:rol => 'selection'}
  named_scope :news, :conditions => {:rol => 'news'}

  # http://zilkey.com/2008/3/24/advanced-acts_as_list-scope-with-multiple-columns
  # #{connection.quote_column_name("rol")}
  def scope_condition
    "card_id = #{card_id} AND rol = #{quote_value(rol)}"
  end

  def extra_meaning
    case self.rol
    when 'selection'
      :mean_position
    when 'news'
      nil
    when 'slide'
      :mean_main
    else
      nil
    end
  end
end

