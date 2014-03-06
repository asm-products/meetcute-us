require 'spec_helper'

describe SubscriptionsController do
  
  include RequestHelpers
  let!(:user) { authed_user }

  after :each do
    Warden.test_reset!
  end

  describe "GET #index" do
    it "populates a list of all subscriptions" do
      subscription = FactoryGirl.create(:subscription)
      get :index, user_id: user
      assigns(:subscriptions).should include(subscription)
    end

    it "renders the index view"
  end

  describe "GET #new" do
    it "assigns a new Subscriptions to @subscription"
    it "renders the new template"
  end

  describe "GET #show" do
    it "assigns the requested subscriptions to @subscription"
    it "renders the :show view"
  end

  describe "GET #edit" do
    it "assigns the requested subscription to @subscription"
  end

  describe "POST #create" do
    context "with valid attributs" do
      it "creates a new subscription"
      it "redirects to the new subscription"
    end

    context "with invalid attributs" do
      it "does not save an invalid subscription"
      it "re-renders the new method"
    end
  end

  describe "PUT #update" do
    before :each do
      @subscription = FactoryGirl.create(:subscription)
    end

    context "with valid attributs" do
      it "locates the requested subscription"
      it "updates the subscription attributes"
      it "re-directs to the updated subscription"
    end

    context "with invalid attributes" do
      it "locates the requested subscription"
      it "does not update @subscription attributes"
      it "re-renders the edit method"
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @subscription = FactoryGirl.create(:subscription)
    end

    it "deletes the subscription"
    it "redirects to accounts#show"
  end

end
