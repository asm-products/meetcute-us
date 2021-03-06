class PlansController < ApplicationController
  
  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end
  
  def show
    @plan = Plan.find(params[:id])
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to user_subscriptions_path current_user
    else 
      render :new
    end
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update_attributes(plan_params)
      redirect_to user_subscriptions_path current_user
    else
      render :edit
    end
  end

  def destroy
    plan = Plan.find(params[:id])
    if plan.destroy
      redirect_to user_subscriptions_path current_user
    end
  end

  private 

  def plan_params 
    params.require(:plan).permit(:amount, :interval, :name, :currency, :stripe_id)
  end
end