require "spec_helper"

describe "Users", :type => :feature do
  
  let!(:user) { authed_user }

  describe "GET /user" do

    it "should have a link to their account info" do
      visit users_path(user)
      expect(page).to have_content "My account"
    end

    it "should have a link to their subscription info" do
      visit users_path(user)
      expect(page).to have_content "My subscription"
    end

  end
end