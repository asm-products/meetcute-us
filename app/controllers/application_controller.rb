class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  # def current_user
  #   @current_user ||= User.find(session[:user_id])
  # end

  helper_method :current_user
end
