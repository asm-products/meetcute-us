 require 'rails_helper'

describe "User Account", :type => :feature do
  
  include RequestHelpers

  describe "GET /account/edit" do
  
    let!(:user) { user_with_account }

    before { visit edit_user_account_path(user) }
    after { Warden.test_reset! }

    it "allows a user to upate their Account" do
      fill_in "account[first_name]", :with => "Myname"
      fill_in "account[last_name]", :with => user.account.last_name
      fill_in "account[username]", :with => user.account.username
      select "January", :from => "account_wedding_date_2i"
      click_button "Update"
      expect(page).to have_content "You updated your account successfully."
      expect(User.last.account.first_name).to eq("Myname")
    end
  end

end
