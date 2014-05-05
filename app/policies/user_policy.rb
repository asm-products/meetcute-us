class UserPolicy < Struct.new(:current_user, :user)

  def index?
    current_user.admin?
  end

end