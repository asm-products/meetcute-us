class LayoutsController < ApplicationController
  
  def index
    @layouts = Layout.all
    authorize @layouts
  end

  def show
    @layout = Layout.find(params[:id])
  end

  def new
    @layout = Layout.new
  end

  def create
    @layout = Layout.create(layout_params)
    if @layout.save
      flash[:notice] = "Layout created successfully."
      redirect_to layout_path @layout
    else
      render :new
    end
  end

  def edit
    @layout = Layout.find(params[:id])
  end

  def update
    @layout = Layout.find(params[:id])
    if @layout.update_attributes(layout_params)
      flash[:notice] = "Layout updated successfully."
      redirect_to layout_path @layout
    else 
      render :edit
    end
  end

  def destroy
    layout = Layout.find(params[:id])
    if layout.destroy
      flash[:notice] = "Layout deleted successfully."
      redirect_to layouts_path
    end
  end

  private

  def layout_params
    params.require(:layout).permit(:name, :description, :site_id)
  end
end
