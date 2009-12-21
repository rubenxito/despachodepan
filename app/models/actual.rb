class Actual
  def initialize
    
  end

  def news
    @news ||= Slide.all(:conditions => {
        :rol => 'news'
      }, :order => 'date ASC', :include => :image)
  end

  def width
    width = news.each.map{|slide| slide.width + 10}.inject {|sum, n| sum + n }
    width = 0 unless width
    width < 843 ? 843 : width
  end
end
