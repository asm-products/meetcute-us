class AccountsController < ApplicationController

  def show
    @account = current_user.account
  end

  def new
    @account = Account.new
  end
  
  def create
    @account = current_user.build_account(account_params)
    if @account.save
      redirect_to user_account_path current_user
    else
      render :new
    end
  end

  def edit
    @account = current_user.account
  end

  def update
    @account = current_user.account
    if @account.update_attributes(account_params)
      redirect_to user_account_path current_user
    else
      render :edit
    end
  end

  def destroy
    account = current_user.account
    if account.destroy
      redirect_to user_path current_user
    end
  end

  private
    
  def account_params
    params.require(:account).permit(:user_id, :first_name, :last_name, :username, :stripe_customer_token, :wedding_date, :subscription_id, :site_id, :sub_domain)
  end
end