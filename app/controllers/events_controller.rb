class EventsController < ApplicationController
  def index
    @events = current_user.site.events
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new(site: current_user.site)
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Your event has been created!"
      redirect_to events_path
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:notice] = "Your event has been updated!"
      redirect_to events_path
    else
      render :edit
    end
  end

  def destroy
    event = Event.find(params[:id])
    if event.destroy
      flash[:notice] = "Your event has been deleted."
      redirect_to events_path
    end
  end

  private

  def event_params
    params.require(:event).permit(:date, :title, :description, :site_id)
  end
end
