class UsersController < ApplicationController
  def index
    @users = User.all()
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(account_params)
      redirect_to account_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    if @user.destroy
      redirect_to user_path
    end
  end

  private
    
    def account_params
      params[:user].permit(:email, :password, :last_name, :username, :wedding_date, :stripe_customer_token, :subscription_id, :site_id, :sub_domain)
    end
end
