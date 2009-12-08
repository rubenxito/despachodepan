
module AdminHelper
  def color_example(value)
    content_tag(:div, ' ', :class => 'color_example', :style => "background-color ##{value}")
  end
end