 require 'spec_helper'

describe "User Account", :type => :feature do
  
  include RequestHelpers

  describe "GET /account/edit" do
  
    let!(:user) { user_with_account }

    before { visit edit_user_account_path(user) }
    after { Warden.test_reset! }
    
    it "should have a first_name field" do
      expect(page).to have_selector("#account_first_name")
    end
    
    it "should have a last_name field" do
      expect(page).to have_selector("#account_last_name")
    end

    it "should have a username field" do
      expect(page).to have_selector("#account_username")
    end

    it "should have a wedding_date field" do
      expect(page).to have_selector("#account_wedding_date")
    end

    it "allows a user to upate their Account" do
      fill_in "account[first_name]", :with => "Myname"
      fill_in "account[last_name]", :with => user.account.last_name
      fill_in "account[username]", :with => user.account.username
      fill_in "account[wedding_date]", :with => user.account.wedding_date
      click_button "Update"
      expect(page).to have_content "You updated your account successfully."
      expect(User.last.account.first_name).to eq("Myname")
    end
  end

end