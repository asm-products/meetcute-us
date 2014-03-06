require 'spec_helper'

describe UsersController do

  include RequestHelpers
  let!(:user) { authed_user }

  after :each do
    Warden.test_reset!
  end

  describe "GET #index" do
    it "populates a list of users"
    it "renders the index view"
  end

  describe "GET #new" do
    it "assigns a new User to @user"
    it "renders the new template"
  end

  describe "GET #show" do
    it "assigns the requested user to @user"
    it "renders the :show view"
  end

  describe "GET #edit" do
    it "assigns the requested user to @user"
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new user"
      it "rediercts to the new user"
    end

    context "with invalid attributes" do
      it "does not save an invalid user"
      it "re-renders the new method"
    end
  end

  describe "PUT #update" do
    before :each do
      @user = FactorGirl.create(:user)
    end

    context "with valid attributes" do
      it "locates the requested user"
      it "updated the @user attributes"
      it "re-directs to to the updated user"
    end

    context "with invalid attributes" do
      it "locates the requested user"
      it "does not update the @user attributes"
      it "re-renders the edit method"
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @user = FactorGirl.create(:user)
    end

    it "deletes the user"
    it "rediercts to users#index"
  end

end
