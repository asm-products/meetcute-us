require 'spec_helper'

describe "Editing a user" do

  describe "GET /users/edit" do

    include RequestHelpers
    let!(:user) { authed_user }
    
    before { visit edit_user_registration_path(user) }
    after { Warden.test_reset! }
    
    it "has an email field" do
      expect(page).to have_selector("#user_email")
    end

    it "has a password field" do
      expect(page).to have_selector("#user_password")
    end

    it "has a confirm password field" do
      expect(page).to have_selector("#user_password_confirmation")
    end
    
    it "has a current password field" do
      expect(page).to have_selector("#user_current_password")
    end

    it "allows a user to upate their info" do
      fill_in "user[email]", :with => "test2@test.com"
      fill_in "user[password]", :with => user.password
      fill_in "user[password_confirmation]", :with => user.password
      fill_in "user[current_password]", :with => user.password
      click_button "Update"
      expect(page).to have_content "You updated your account successfully."
      expect(User.last.email).to eq("test2@test.com")
    end
  end

end