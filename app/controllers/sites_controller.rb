class SitesController < ApplicationController
  def index
    @sites = Site.all
    authorize @sites
  end

  def show
    @site = Site.find_by_subdomain!(request.subdomain)
  end

  def new
    @site = current_user.build_site
  end

  def create
    @site = current_user.build_site(site_params)
    if @site.save
      flash[:notice] = "Your new site has been created!"
      redirect_to user_site_path current_user
    else
      render :new
    end
  end

  def edit
    @site = current_user.site
    @layout = Layout.new
  end

  def update
    @site = current_user.site
    if @site.update_attributes(site_params)
      flash[:notice] = "You updated your site successfully!"
      redirect_to edit_user_site_path current_user
    else
      render :edit
    end
  end

  def destroy
    site = current_user.site
    if site.destroy
      flash[:notice] = "Your site has been deleted."
      redirect_to user_account_path current_user
    end
  end

  private

  def site_params
    params.require(:site).permit(:user_id, :name, :description, :analytics, :password_protected, :is_indexed, :subdomain, { :design_attributes => [:id] })
  end
end
