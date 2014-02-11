require 'spec_helper'

describe "The Signup process", :type => :feature do
  let!(:user) {FactoryGirl.create(:user)}

  describe "GET /users/sign_up" do
    it "let's users sign up" do
      visit new_user_registration_path
      fill_in "Email", :with => user.email
      response.status.should be(200)
    end
  end
end
