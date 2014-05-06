class LayoutPolicy < ApplicationPolicy
  
  def index?
    @user.admin?
  end
  
end