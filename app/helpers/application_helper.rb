
module ApplicationHelper
  def beautify(text)
		RedCloth.new(text).to_html unless text.nil?
	end


  def title(title)
    content_for(:title) {title}
    "<h1>#{title}</h1>"
  end

  def c(value)
    "##{value}"
  end

  def new?(model, create, update)
    model.new_record? ? create : update
  end
end
