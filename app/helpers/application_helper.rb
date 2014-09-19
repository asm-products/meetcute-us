module ApplicationHelper
  def vertical_nav_link(link_text, link_path)
    class_name = request.path.include?(link_text.downcase) ? "active" : ""

    content_tag(:li) do
      link_to (link_text + content_tag(:i, "", class: "fa fa-angle-right pull-right")).html_safe, link_path, :class => "main-nav-item #{class_name}"
    end
  end

  def add_fields_data(form_builder, association)
    new_object = form_builder.object.send(association).klass.new
    id = new_object.id
    form_builder.fields_for(association, new_object, :child_index => id) do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
  end

end
