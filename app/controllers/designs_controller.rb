class DesignsController < ApplicationController
  
  def index
    @designs = Design.all
    authorize @designs
  end

  def show
    @design = Design.find(params[:id])
  end

  def new
    @design = Design.new
  end

  def create
    @design = Design.create(design_params)
    authorize @design
    if @design.save
      flash[:notice] = "Design created successfully."
      redirect_to design_path @design
    else
      render :new
    end
  end

  def edit
    @design = Design.find(params[:id])
    authorize @design
  end

  def update
    @design = Design.find(params[:id])
    authorize @design
    if @design.update_attributes(design_params)
      flash[:notice] = "Design updated successfully."
      redirect_to design_path @design
    else 
      render :edit
    end
  end

  def destroy
    design = Design.find(params[:id])
    authorize design
    if design.destroy
      flash[:notice] = "Design deleted successfully."
      redirect_to designs_path
    end
  end

  private

  def design_params
    params.require(:design).permit(:name, :description, :site_id)
  end
end

