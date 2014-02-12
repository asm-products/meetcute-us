require "spec_helper"

describe "Users", :type => :feature do
  include Warden::Test::Helpers
  Warden.test_mode!

  let!(:user) { FactoryGirl.create(:user) }

  before :each do
    login_as(user, :scope => :user)
  end

  describe "GET /users" do

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