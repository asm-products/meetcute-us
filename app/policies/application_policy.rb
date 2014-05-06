class ApplicationPolicy
  
  def initialize(user, record)
    raise Pundit::NotAuthorizedError unless user
    @user = user
    @record = record
  end
end