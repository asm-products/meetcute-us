module RequestHelpers
  
  include Warden::Test::Helpers

  Warden.test_mode!

  def authed_user
    user = create(:user)
    login_as(user, :scope => :user)
    user
  end

  def user_with_account 
    user = create(:user, account_attributes: attributes_for(:account))
    login_as(user, :scope => :user)
    user
  end

  def user_with_account_site 
    user = create(:user, account_attributes: attributes_for(:account), site_attributes: attributes_for(:site))
    login_as(user, :scope => :user)
    user
  end

end