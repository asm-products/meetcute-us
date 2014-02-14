require 'spec_helper'

describe AccountsController do

  include RequestHelpers
  let!(:user) { authed_user }

  after :each do
    Warden.test_reset!
  end

  describe "GET 'show'" do
    it "returns http success" do
      visit user_account_path(user)
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      visit edit_user_account_path(user)
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      visit edit_user_account_path(user)
      response.should be_success
    end
  end

end
