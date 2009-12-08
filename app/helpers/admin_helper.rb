
module AdminHelper
  def color_example(value)
    content_tag(:div, '&nbsp;', :class => 'color_example', :style => "background-color: ##{value}")
  end

  def submit_label(model)
    model.new_record? ? :create : :update
  end
end