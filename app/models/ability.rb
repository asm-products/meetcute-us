class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
      
    base_models = %w[User Account Plan Subscription]
    alias_action :create, :read, :update, :destroy, :to => :crud

    case user.role
    when "admin"
      can :manage, :all
    when "bronze"
      can :crud, base_models
    when "silver"
      can :crud, base_models
    when "gold"
      can :crud, base_models
    end

  end
end