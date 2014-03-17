require "spec_helper"

describe "User sessions", :type => :feature do

  describe "GET /users/sign_in" do

    it "has a sign in page" do
      visit new_user_session_path
      expect(page).to have_content "Sign in"
    end

    it "has an email field" do  
      visit new_user_session_path
      page.should have_selector("#user_email")
    end

    it "has a passeword field" do
      visit new_user_session_path
      page.should have_selector("#user_password")
    end

    it "does not accept an invalid email address" do
      visit new_user_session_path
      fill_in "user[email]", :with => "test@test"
      click_button "Sign in"
      expect(page).to have_content "Invalid email or password"
    end

    it "does not accept an invalid password" do
      visit new_user_session_path
      fill_in "user[password]", :with => "test"
      click_button "Sign in"
      expect(page).to have_content "Invalid email or password"
    end

    # it "allows users so sign in" do
    #   user = FactoryGirl.create(:user)
    #   visit new_user_session_path
    #   fill_in "user[email]", :with => user.email
    #   fill_in "user[password]", :with => user.password
    #   click_button "Sign in"
    #   expect(page).to have_content "Signed in successfully."
    # end

  end
end