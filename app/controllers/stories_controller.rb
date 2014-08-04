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
	@story = Story.new(story_params)
	if @story.save
	  flash[:notice] = "Your story has been created!"
	  redirect_to stories_path
	end
  end

  def edit
	@story = Story.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def story_params
	params.require(:story).permit(:title, :content, :image, :display_order, :site_id)
  end
end
