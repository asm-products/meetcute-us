require "spec_helper"

describe "Users", :type => :feature do
  
  include RequestHelpers
  let!(:user) { authed_user }

  after :each do
    Warden.test_reset!
  end

  describe "GET /user" do

    # it "should have a link to their account info" do
    #   visit user_path(user)
    #   expect(page).to have_content "My account"
    # end

    # it "should have a link to their subscription info" do
    #   visit user_path(user)
    #   expect(page).to have_content "My subscription"
    # end

  end
end