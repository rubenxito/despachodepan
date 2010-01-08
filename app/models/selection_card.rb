
class SelectionCard
  def top
    @top ||= Slide.all(:conditions => {
        :rol => 'selection',
        :extra => 'top'
      }, :order => 'rev_date ASC', :include => :image)
  end

  def bottom
    @bottom ||= Slide.all(:conditions => {
        :rol => 'selection',
        :extra => 'bottom'
      }, :order => 'rev_date ASC', :include => :image)
  end

  def width
    if !@width
      max_top = top.each.map{|slide| slide.width + 10}.inject {|sum, n| sum + n }
      max_bottom = bottom.each.map{|slide| slide.width + 10}.inject {|sum, n| sum + n }
      @width = (max_top && max_bottom) ? (max_top > max_bottom ? max_top : max_bottom) : 0
      @width = @width <  843 ? 843 : @width
    end
    @width
  end
end
