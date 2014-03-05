require 'spec_helper'

describe AccountsController do

  include RequestHelpers
  let!(:user) { authed_user }

  after :each do
    Warden.test_reset!
  end

  describe "GET #show" do
    it "assigns the requested account to @account" do
      account = FactoryGirl.create(:account)
      get :show, id: account
      assigns(:account).should eq(account)
    end
    
    it "renders the :show view" do
      account = FactoryGirl.create(:account)
      get :show, id: account
      response.should render_template :show
    end
  end

  describe "GET #edit" do
    it "assigns the requested account to @account" do
      account = FactoryGirl.create(:account)
      get :edit, id: account
      assigns(:account).should eq(account)
    end
  end

  describe "PUT #update" do
    before :each do
      @account = FactoryGirl.create(:account)
    end
    
    context "with valid attributes" do
      it "locates the requested account" do
        put :update, id: @account, account: FactoryGirl.attributes_for(:account)
        assigns(:account).should eq(@account)
      end
      
      it "updates the @account attributes" do
        put :update, id: @account, account: FactoryGirl.attributes_for(:account, first_name: "bob", last_name: "jones")
        @account.reload
        @account.first_name.should eq("bob")
        @account.last_name.should eq("jones")
      end
      
      it "re-directs to the updated account" do
        put :update, id: @account, account: FactoryGirl.attributes_for(:account)
        response.should redirect_to @account
      end
    end

    context "with invalid attributes" do
      it "locates the requested account" do
        put :update, id: @account, account: FactoryGirl.attributes_for(:invalid_account)
        assigns(:account).should eq(@account)
      end
      
      it "does not update @account attributes" do
        put :update, id: @account, account: FactoryGirl.attributes_for(:account, first_name: "jack", last_name: nil)
        @account.reload
        @account.first_name.should_not eq("jack")
        @account.last_name.should_not eq("jackson")
      end

      it "re-renders the edit method" do
        put :update, id: @account, account: FactoryGirl.attributes_for(:invalid_account)
        response.should render_template :edit
      end
    end
  end

end
