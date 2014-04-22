require 'spec_helper'

describe "User registration", :type => :feature do

  describe "GET /users/sign_up" do
    
    before { visit new_user_registration_path }

    it "has a sign up page" do
      expect(page).to have_content "Sign up"
    end

    it "has a first_name field" do
      expect(page).to have_selector("#account_first_name")
    end

    it "has a last_name field" do
      expect(page).to have_selector("#account_last_name")
    end

    it "has a wedding_date field" do
      expect(page).to have_selector("#account_wedding_date")
    end

    it "has a sub_domain field" do
      expect(page).to have_selector("#account_sub_domain")
    end

    it "has an email field" do 
      expect(page).to have_selector("#user_email")
    end

    it "has a password field" do
      expect(page).to have_selector("#user_password")
    end

    it "has a confirm password field" do
      expect(page).to have_selector("#user_password_confirmation")
    end

    it "does not accept an invalid email address" do
      fill_in "user[email]", :with => "test@test"
      click_button "Sign up"
      expect(page).to have_content "Email is invalid"
    end

    it "does not accept an invalid password" do
      fill_in "user[password]", :with => "test"
      click_button "Sign up"
      expect(page).to have_content "Password is too short"
    end

    it "allows users so sign up" do
      user = FactoryGirl.build(:user)
      account = FactoryGirl.build(:account)
      fill_in "account[first_name]", :with => account.first_name
      fill_in "account[last_name]", :with => account.last_name
      fill_in "user[email]", :with => user.email
      fill_in "user[password]", :with => user.password
      fill_in "user[password_confirmation]", :with => user.password
      fill_in "account[wedding_date]", :with => account.wedding_date
      fill_in "account[sub_domain]", :with => account.sub_domain
      click_button "Sign up"
      expect(page).to have_content "Welcome! You have signed up successfully."
      # expect(Account.find_by_user_id(user.id)).to exist
    end
  
  end
end
