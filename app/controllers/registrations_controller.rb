class RegistrationsController < Devise::RegistrationsController
  layout "main"
  before_filter :configure_permitted_parameters

  def new
    build_resource({})
    resource.build_account
    resource.build_site
    respond_with self.resource
  end

  private

  def configure_permitted_parameters
    allowed_account_attributes = [ :user_id, :first_name, :last_name, :username, :wedding_date, :stripe_customer_token, :subscription_id, :site_id]
    allowed_site_attributes = [ :user_id, :name, :description, :analytics, :password_protected, :is_indexed, :layout_id, :subdomain]

    devise_parameter_sanitizer.for(:sign_up) do |parameters|
      parameters.permit(:email, :password, :account_id, :role, { :account_attributes => allowed_account_attributes }, { :site_attributes => allowed_site_attributes })
    end
  end

end