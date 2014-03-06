class AccountsController < ApplicationController
  
  def index
    @accounts = Account.all()
  end

  def new
    @account = Account.new
  end
  
  def create
    account = Account.create(account_params)
    if account.save
      redirect_to account_path(account)
    else
      render :new
    end
  end

  def show
    @account = Account.find(params[:id])
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])
    if @account.update_attributes(account_params)
      redirect_to account_path(@account), :flash => { :success => "Profile settings updated successfully." }
    else
      render :edit
    end
  end

  def destroy
    account = Account.find(params[:id])
    if account.destroy
      redirect_to user_path
    end
  end

  private
    
    def account_params
      params[:account].permit(:user_id, :first_name, :last_name, :username, :wedding_date, :stripe_customer_token, :subscription_id, :site_id, :sub_domain)
    end
end