
module AdminHelper
  def color_example(value)
    content_tag(:div, value, :class => 'color_example', :style => "background-color: ##{value}")
  end

  def submit_label(model)
    model.new_record? ? :create : :update
  end

  def action_separator
    '<div class="separator">&nbsp;</div>'
  end

  def selection_actions(card)
    card.selection.active? ? link_to('Ver selección', card.selection) :
      link_to('Seleccionar', card.selection, :class => 'selection_add')
  end
end