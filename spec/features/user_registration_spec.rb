require 'rails_helper'

describe "User registration", :type => :feature do

  include RequestHelpers

  describe "GET /users/sign_up" do

    before { visit new_user_registration_path }

    it "has a sign up page" do
      expect(page).to have_content "Sign up"
    end

    it "has a first_name field" do
      expect(page).to have_selector("#user_account_attributes_first_name")
    end

    it "has a last_name field" do
      expect(page).to have_selector("#user_account_attributes_last_name")
    end

    it "has a wedding_date field" do
      expect(page).to have_selector("#user_account_attributes_wedding_date")
    end

    it "has a subdomain field" do
      expect(page).to have_selector("#user_site_attributes_subdomain")
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
      within("#new_user") do
        fill_in "user[email]", :with => "test@test"
        click_button "Sign up"
      end
      expect(page).to have_content "Email is invalid"
    end

    it "does not accept an invalid password" do
      within("#new_user") do
        fill_in "user[password]", :with => "test"
        click_button "Sign up"
      end
      expect(page).to have_content "Password is too short"
    end

    it "allows users so sign up" do
      user = build(:user)
      account = build(:account)
      site = build(:site)

      within("#new_user") do
        fill_in "user[account_attributes][first_name]", :with => account.first_name
        fill_in "user[account_attributes][last_name]", :with => account.last_name
        fill_in "user[email]", :with => user.email
        fill_in "user[password]", :with => user.password
        fill_in "user[password_confirmation]", :with => user.password
        fill_in "user[account_attributes][wedding_date]", :with => account.wedding_date
        fill_in "user[site_attributes][subdomain]", :with => site.subdomain
        click_button "Sign up"
      end

      expect(page).to have_content "Welcome! You have signed up successfully."
      expect(Account.where("user_id = #{User.last.id}")).to exist
      expect(Site.where("user_id = #{User.last.id}")).to exist
    end

  end

  describe "GET /users/edit" do

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
