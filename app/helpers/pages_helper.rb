module PagesHelper
	# ======= FICHA
	WIDTH = 420;
  HEIGHT = 400;

  def year_of(date)
    date.split('/').last
  end

	def style_of(image)
		left = (WIDTH - image.width) / 2;
		top = (HEIGHT - image.height) / 2;
		"display: none; margin-left: #{left}px; margin-top: #{top}px"
	end

	def border_tab(value)
		"border-left: 1px solid ##{value}; border-top: 1px solid ##{value}; border-right: 1px solid ##{value}"
	end

	# ====== TAGS
	def tag_ids(tag)
		tag.cards.collect{|card| card.id}.join(',')
	end

	# ========= GRID
  BLOC_SIZE = 12;

	def pinta_card(card)
		pinta_caption(card) + pinta_main(card) + pinta_line(card)
	end

	def pinta_milestones(card)
		result = ""
		begin_column = card.begin_column
		for slide in card.photos
			pinta_slide(card, slide, begin_column, result) unless slide.date.blank? || slide.date.to_i == 0
		end
		result.to_s
	end

  private

	def pinta_caption(card)
		id = "caption-#{card.id}"
		width = 200
		left = (card.begin_column) * BLOC_SIZE 	- width -3
		top = (card.vposition) * BLOC_SIZE
		style = new_style(left, top, width, nil, nil)
		style['text-align'] = 'right'
		style['color'] = "##{card.color.value}"
    clazz = "card element card#{card.id} caption"
    content_tag :a, card.title, {:class => clazz, :id => id,
      :href => "/#{card.url}",
      :style => style.pinta}
	end

	def pinta_main(card)
		id = "main-#{card.main_slide.id}-#{card.id}"
		extra = card.main_slide.nil? ? "" : "preview"
		extra = extra + " blank" if !card.link.blank? || !card.main_file.nil?
		top = card.vposition * BLOC_SIZE
		style = new_style(card.begin_column * BLOC_SIZE, top, BLOC_SIZE, BLOC_SIZE, card.color.value)
		style['font-size'] = '1px'
    clazz = "card element card#{card.id} #{extra}"
    content_tag :a, card.title, {:class => clazz, :id => id,
      :href => "/#{card.url}",
      :style => style.pinta}
	end

	def pinta_slide(card, slide, begin_column, memo)
		id = "milestone-#{slide.id}-#{card.id}"
		left = (begin_column + slide.date.to_i) * BLOC_SIZE
		top = card.vposition * BLOC_SIZE
		style = new_style(left, top, BLOC_SIZE - 4, BLOC_SIZE - 4, 'white')
    style['border'] = "2px solid ##{card.color.value};"
		style['font-size'] = '1px'
    clazz = "card element milestone preview card#{card.id}"
    memo << content_tag(:a, ' ', {:class => clazz, :id => id, 
        :href => "/#{card.url}#/imagen=#{slide.pos}",
        :style => style.pinta})
	end

	def pinta_line(card)
		id = "line-#{card.id}"
		left = (card.begin_column + 1) * BLOC_SIZE + 2
		width = (card.end_column - card.begin_column - 1) * BLOC_SIZE - 3
		top = (card.vposition + 1) * BLOC_SIZE - 2
		style = new_style(left, top, width, 2, card.color.value)
		style['font-size'] = '1px'
		pinta_div(id, "card element card#{card.id}", style, '&nbsp;')
	end

	def new_style(left, top, width, height = nil, bgcolor = nil)
		styles = {}
		styles[:left] = "#{left}px" unless left.nil?
		styles[:top] = "#{top}px" unless top.nil?
		styles[:width] = "#{width}px" unless width.nil?
		styles[:height] = "#{height}px" unless height.nil?
		styles['background-color'] = "##{bgcolor}" unless bgcolor.nil?
		def styles.pinta
			style = ""
			each_pair {|k, v| style += k.to_s + ': ' + v.to_s + '; '}
			style
		end
		styles
	end

	def pinta_div(id, clazz, style, content)
		content_tag :div, content, :class => clazz, :id => id, :style => style.pinta
	end
end
