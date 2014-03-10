require 'spec_helper'

describe AccountsController do
  login_user

  before :each do
    @account = subject.current_user.build_account(FactoryGirl.attributes_for(:account))
    @account.save
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
      get :show, id: @account, user_id: subject.current_user
      assigns(:account).should eq(@account)
    end
    
    it "renders the :show view" do
      get :show, id: @account, user_id: subject.current_user
      response.should render_template :show
    end
  end

  describe "GET #edit" do
    it "assigns the requested account to @account" do
      get :show, id: @account, user_id: subject.current_user
      assigns(:account).should eq(@account)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new account" do
        post :create, user_id: subject.current_user, account: FactoryGirl.attributes_for(:account)
        subject.current_user.account.should be_valid
      end
      
      it "redirects to the new account" do
        post :create, user_id: subject.current_user, account: FactoryGirl.attributes_for(:account)
        response.should redirect_to user_account_path subject.current_user
      end
    end

    context "with invalid attributes" do
      it "does not save an invalid account" do
        post :create, user_id: subject.current_user, account: FactoryGirl.attributes_for(:invalid_account)
        subject.current_user.account.should_not be_valid
      end
      
      it "re-renders the new method" do
        post :create, user_id: subject.current_user, account: FactoryGirl.attributes_for(:invalid_account)
        response.should render_template :new
      end
    end
  end

  describe "PUT #update" do
    
    context "with valid attributes" do
      it "locates the requested account" do
        put :update, user_id: subject.current_user, account: FactoryGirl.attributes_for(:account)
        assigns(:account).should eq(@account)
      end
      
      it "updates the @account attributes" do
        put :update, user_id: subject.current_user, account: FactoryGirl.attributes_for(:account, first_name: "bob", last_name: "jones")
        @account.reload
        @account.first_name.should eq("bob")
        @account.last_name.should eq("jones")
      end
      
      it "re-directs to the updated account" do
        put :update, user_id: subject.current_user, account: FactoryGirl.attributes_for(:account)
        response.should redirect_to user_account_path subject.current_user
      end
    end

    context "with invalid attributes" do
      it "locates the requested account" do
        put :update, user_id: subject.current_user, account: FactoryGirl.attributes_for(:invalid_account)
        assigns(:account).should eq(@account)
      end
      
      it "does not update @account attributes" do
        put :update, user_id: subject.current_user, account: FactoryGirl.attributes_for(:account, first_name: "jack", last_name: nil)
        @account.reload
        @account.first_name.should_not eq("jack")
        @account.last_name.should_not eq("jackson")
      end

      it "re-renders the edit method" do
        put :update, user_id: subject.current_user, account: FactoryGirl.attributes_for(:invalid_account)
        response.should render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do

    it "deletes the account" do
      expect{
        delete :destroy, user_id: subject.current_user, account: FactoryGirl.attributes_for(:account)
      }.to change(Account, :count).by(-1)
    end
    
    it "redirects to accounts#index" do
      delete :destroy, user_id: subject.current_user, account: FactoryGirl.attributes_for(:account)
      response.should redirect_to user_path subject.current_user
    end
  end

end
