class SitePolicy < ApplicationPolicy

  def index?
    @user.admin?
  end

end