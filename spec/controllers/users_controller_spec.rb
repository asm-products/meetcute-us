require 'spec_helper'

describe UsersController do

  include RequestHelpers
  let!(:user) { authed_user }

  after :each do
    Warden.test_reset!
  end

  describe "GET 'index'" do
    it "returns http success" do
      visit users_path
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      visit user_path(user)
      response.should be_success
    end
  end

end
