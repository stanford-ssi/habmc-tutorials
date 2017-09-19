module ApplicationHelper

  def menu_item(name, path)
    css_class = ''

    if current_page? path
      css_class = 'active'
    end

    "<li class=\"#{css_class}\">#{link_to name, path}</li>".html_safe
  end

end
