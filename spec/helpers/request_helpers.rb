module RequestHelpers
  
  include Warden::Test::Helpers

  Warden.test_mode!

  def authed_user
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    user
  end

end