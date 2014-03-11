class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
      
    alias_action :create, :read, :update, :destroy, :to => :crud

    can :manage, :all if user.role == "admin"
  end
end