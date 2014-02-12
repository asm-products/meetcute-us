require 'spec_helper'

describe "User registration", :type => :feature do

  describe "GET /users/sign_up" do
    
    it "has a sign up page" do
      visit new_user_registration_path
      expect(page).to have_content "Sign up"
    end

    it "has an email field" do 
      visit new_user_registration_path
      page.should have_selector("#user_email")
    end

    it "has a password field" do
      visit new_user_registration_path
      page.should have_selector("#user_password")
    end

    it "has a confirm password field" do
      visit new_user_registration_path
      page.should have_selector("#user_password_confirmation")
    end

    it "does not accept an invalid email address" do
      visit new_user_registration_path
      fill_in "user[email]", :with => "test@test"
      click_button "Sign up"
      expect(page).to have_content "Email is invalid"
    end

    it "does not accept an invalid password" do
      visit new_user_registration_path
      fill_in "user[password]", :with => "test"
      click_button "Sign up"
      expect(page).to have_content "Password is too short"
    end

    it "allows users so sign up" do
      user = FactoryGirl.build(:user)
      visit new_user_registration_path
      fill_in "user[email]", :with => user.email
      fill_in "user[password]", :with => user.password
      fill_in "user[password_confirmation]", :with => user.password
      click_button "Sign up"
      expect(page).to have_content "Welcome! You have signed up successfully."
    end
  
  end
end
