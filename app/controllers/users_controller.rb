class UsersController < ApplicationController

  load_and_authorize_resource 
  skip_load_resource only: [:create] 

  # CanCan is taking care of loading resources in this controller
  
  def index
  end

  def new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to user_account_path(@user)
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
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
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

  def user_params
    params.require(:user).permit(:email, :password, :account_id, :role, { :account => [ :user_id, :first_name, :last_name, :username, :wedding_date, :stripe_customer_token, :subscription_id, :site_id, :sub_domain ]})
  end

end
