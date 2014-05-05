class LayoutPolicy < Struct.new(:user, :layout)
  def index?
    user.admin?
  end
end