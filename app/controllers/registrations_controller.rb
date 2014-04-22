class RegistrationsController < Devise::RegistrationsController

  before_filter :configure_permitted_parameters

  def new
    build_resource({})
    resource.build_account
    respond_with self.resource
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |parameters|
      parameters.permit(:email, :password, :account_id, :role, { :account_attributes => [ :user_id, :first_name, :last_name, :username, :wedding_date, :stripe_customer_token, :subscription_id, :site_id, :sub_domain ]})
    end
  end

end