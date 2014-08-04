module ApplicationHelper
  def vertical_nav_link(link_text, link_path)
    class_name = request.path.include?(link_text.downcase) ? "active" : ""

    content_tag(:li) do
      link_to (link_text + content_tag(:i, "", class: "fa fa-angle-right pull-right")).html_safe, link_path, :class => "main-nav-item #{class_name}"
    end
  end
end
