module RequestHelpers
  
  include Warden::Test::Helpers

  Warden.test_mode!

  def authed_user
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    user
  end

  def user_with_account 
    user = FactoryGirl.create(:user, account_attributes: FactoryGirl.attributes_for(:account))
    login_as(user, :scope => :user)
    user
  end

end