require 'spec_helper'

describe "User Account", :type => :feature do
  
  include RequestHelpers
  let!(:user) { authed_user }

  before { visit edit_user_account_path(user) }
  after { Warden.test_reset! }

  describe "GET /account/edit" do
    it "should have a hidden field for the user_id"
    it "should have a first_name field"
    it "should have a last_name field"
    it "should have a username field"
    it "should have a wedding_date field"
    it "should have a sub_domain field"
  end

end