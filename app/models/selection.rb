
class Selection
  def top
    @top ||= Card.find(:all, :conditions => {
        :selected => true,
        :selection_position => Card::POSITION[:top]
      })
  end

  def bottom
    @bottom ||= Card.find(:all, :conditions =>
        {
        :selected => true,
        :selection_position => Card::POSITION[:bottom]
      })
  end

  def width
    if !@width
      max_top = top.each.map{|card| card.selection_width + 10}.inject {|sum, n| sum + n }
      max_bottom = bottom.each.map{|card| card.selection_width + 10}.inject {|sum, n| sum + n }
      @width = max_top > max_bottom ? max_top : max_bottom
    end
    @width
  end

end
