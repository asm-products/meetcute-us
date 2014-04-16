class SubscriptionsController < ApplicationController
  
  def index
    @subscriptions = current_user.subscriptions
  end

  def show
    unless current_user.subscriptions.present?
      redirect_to new_user_subscription_path(current_user)
    else
      @subscription = current_user.subscriptions.find(params[:id])
    end
  end

  def new
    plan = Plan.find(params[:plan_id])
    @subscription = plan.subscriptions.build
  end

  def create
    @subscription = current_user.subscriptions.build(subscription_params)
    if @subscription.save_with_payment
      redirect_to subscription_path @subscription
    else 
      render :new
    end
  end

  def edit
    @subscription = current_user.subscriptions.find(params[:id])
  end

  def update
    @subscription = current_user.subscriptions.find(params[:id])
    if @subscription.update_attributes(subscription_params)
      redirect_to subscription_path @subscription
    else
      render :edit
    end
  end

  def destroy
    @subscription = current_user.subscriptions.find(params[:id])
    if @subscription.destroy
      redirect_to user_subscriptions_path current_user
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:plan_id, :user_id, :stripe_customer_token, :stripe_card_token)
  end
end