class StoriesController < ApplicationController
  layout "dashboard", :except => [:show]

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
	else
	  render :new
	end
  end

  def edit
	@story = Story.find(params[:id])
  end

  def update
	@story = Story.find(params[:id])
	if @story.update_attributes(story_params)
	  flash[:notice] = "Your story has been updated!"
	  redirect_to stories_path
	else
	  render :edit
	end
  end

  def destroy
	story = Story.find(params[:id])
	if story.destroy
	  flash[:notice] = "Your story has been deleted."
	  redirect_to stories_path
	end
  end

  private

  def story_params
	params.require(:story).permit(:title, :content, :image, :display_order, :site_id)
  end
end
