class GalleriesController < ApplicationController
  def index
  end

  def new
    @gallery = Gallery.new(site: current_user.site)
  end
  
  def create
  end

  def update
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
