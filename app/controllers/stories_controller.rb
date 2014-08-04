class StoriesController < ApplicationController
  def index
	@stories = current_user.site.stories
  end

  def show
	@story = Story.find(params[:id])
  end

  def new
	@story = Story.new(site: current_user.site)
  end

  def create
  end

  def edit
	@story = Story.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
