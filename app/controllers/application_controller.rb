class ApplicationController < ActionController::Base
  include Pundit
 
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
  
  def user_not_authorized 
    flash[:error] = "You are not authorized to perform this action"
    redirect_to request.referrer || root_path
  end
end
