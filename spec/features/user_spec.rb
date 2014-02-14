require "spec_helper"

describe "Users", :type => :feature do
  
  include RequestHelpers
  
  before :each do
    @user = authed_user 
  end

  after :each do
    Warden.test_reset!
  end

  describe "GET /user" do

    it "should have a link to their account info" do
      visit user_path(@user.id)
      expect(page).to have_content "My account"
    end

    it "should have a link to their subscription info" do
      visit user_path(@user.id)
      expect(page).to have_content "My subscription"
    end

  end
end