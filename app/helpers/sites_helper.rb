module SitesHelper
  def render_design(site)
    render partial: "designs/layouts/#{site.design.name.split(" ").join.underscore}_#{site.design.id}", :site => site
  end
end