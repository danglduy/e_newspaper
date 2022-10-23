ActionView::Base.field_error_proc = proc do |html|
  frag = Nokogiri::HTML5::DocumentFragment.parse(html)
  element = frag.children[0]

  if element.present?
    element.add_class('is-invalid')
  end

  frag.to_html.html_safe
end
