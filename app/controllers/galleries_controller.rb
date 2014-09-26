class GalleriesController < ApplicationController
  layout "dashboard"

  def index
    @galleries = current_user.site.galleries
  end

  def new
    @gallery = Gallery.new(site: current_user.site)
  end
  
  def create
    @gallery = Gallery.new(gallery_params)
    if @gallery.save
      flash[:notice] = "Gallery created successfully"
      redirect_to galleries_path
    else
      render :new
    end
  end

  def update
    @gallery = Gallery.find(params[:id])
    if @gallery.update_attributes(gallery_params)
      flash[:notice] = "Gallery updated successfully"
      redirect_to galleries_path
    else
      render :edit
    end
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    if @gallery.destroy
      flash[:notice] = "Gallery deleted successfully"
      redirect_to galleries_path
    end
  end

  private

  def gallery_params
    params.require(:gallery).permit(:title, :description, :site_id,  images_attributes: [ :image, :caption, :_destroy ])
  end

  def user_gallery
    @gallery ||= Gallery.find(params[:id])
  end
end
