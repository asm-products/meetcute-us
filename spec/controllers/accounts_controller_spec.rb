require 'spec_helper'

describe AccountsController do
  login_user

  describe "GET #index" do
    it "populates a list of accounts" do
      account = FactoryGirl.create(:account)
      get :index, user_id: subject.current_user
      assigns(:accounts).should include(account)
    end

    it "renders the index view" do
      get :index, user_id: subject.current_user
      response.should render_template :index
    end
  end

  describe "GET #new" do
    it "assigns a new Account to @account" do
      get :new, user_id: subject.current_user
      assigns(:account).should_not be_nil
    end

    it "renders the new template" do
      get :new, user_id: subject.current_user
      response.should render_template :new
    end
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

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new account" do
        user = FactoryGirl.create(:user)
        expect{
          post :create, user_id: user, account: FactoryGirl.attributes_for(:account)
        }.to change(Account, :count).by(1)
      end
      
      it "redirects to the new account" do
        post :create, user_id: subject.current_user, account: FactoryGirl.attributes_for(:account)
        response.should redirect_to Account.last
      end
    end

    context "with invalid attributes" do
      it "does not save an invalid account" do
        user = FactoryGirl.create(:user)
        expect {
          post :create, user_id: user, account: FactoryGirl.attributes_for(:invalid_account)
        }.to_not change(Account, :count)
      end
      
      it "re-renders the new method" do
        user = FactoryGirl.create(:user)
        post :create, user_id: user, account: FactoryGirl.attributes_for(:invalid_account)
        response.should render_template :new
      end
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

  describe "DELETE #destroy" do
    before :each do
      @account = FactoryGirl.create(:account)
    end

    it "deletes the account" do
      expect{
        delete :destroy, id: @account
      }.to change(Account, :count).by(-1)
    end
    
    it "redirects to accounts#index" do
      delete :destroy, id: @account, user_id: subject.current_user
      response.should redirect_to user_path
    end
  end

end
