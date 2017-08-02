module ApplicationHelper
  def header_nav_link(text, path)
    options = current_page?(path) || (path != "/" && request.path.starts_with?(path)) ? { class: "active" } : {}
    content_tag(:li, options) do
      link_to text, path
    end
  end

  def site_color
    # orange, pink, purple, blue, green, red
    "body-orange"
  end
end
