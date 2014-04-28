class SitesController < ApplicationController
  def index
    @sites = Site.all()
  end

  def show
    @site = Site.find(params[:id])
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
  end

  def update
  end

  def delete
  end

  def destroy
  end

  private

  def site_params
    params.require(:site).permit(:user_id, :name, :description, :analytics, :password_protected, :is_indexed, :layout_id, :subdomain)
  end
end
