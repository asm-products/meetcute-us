class SubscriptionsController < ApplicationController
  
  def index
    @subscriptions = current_user.subscriptions
  end

  def show
    @subscription = current_user.subscriptions.find(params[:id])
  end

  def new
    @subscription = Subscription.new
  end

  def create
  end

  def edit
    @subscription = current_user.subscriptions.find(params[:id])
  end

  def update
  end

  def delete
  end

  def destroy
  end

  private

  def subscription_params
    params.permit(:id, :plan_id, :user_id, :stripe_customer_token)
  end
end