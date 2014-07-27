require 'rails_helper'

describe AccountsController, :type => :controller do
  login_user

  # TODO: DRY up the before blocks in this file.

  describe "GET #new" do
    it "assigns a new Account to @account" do
      get :new, user_id: subject.current_user
      expect(assigns(:account)).not_to be_nil
    end

    it "renders the new template" do
      get :new, user_id: subject.current_user
      expect(response).to render_template :new
    end
  end

  describe "GET #show" do

    before :each do
      @account = subject.current_user.build_account(attributes_for(:account))
      @account.save
    end

    it "assigns the requested account to @account" do
      get :show, id: @account, user_id: subject.current_user
      expect(assigns(:account)).to eq(@account)
    end

    it "renders the :show view" do
      get :show, id: @account, user_id: subject.current_user
      expect(response).to render_template :show
    end
  end

  describe "GET #edit" do
    it "assigns the requested account to @account" do
      get :show, id: @account, user_id: subject.current_user
      expect(assigns(:account)).to eq(@account)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new account" do
        expect {
          post :create, user_id: subject.current_user, account: attributes_for(:second_account)
        }.to change(Account, :count).by(1)
      end

      it "redirects to the new account" do
        post :create, user_id: subject.current_user, account: attributes_for(:account)
        expect(response).to redirect_to user_account_path subject.current_user
      end
    end

    context "with invalid attributes" do
      it "does not save an invalid account" do
        post :create, user_id: subject.current_user, account: attributes_for(:invalid_account)
        expect(subject.current_user.account).not_to be_valid
      end

      it "re-renders the new method" do
        post :create, user_id: subject.current_user, account: attributes_for(:invalid_account)
        expect(response).to render_template :new
      end
    end
  end

  describe "PUT #update" do

    before :each do
      @account = subject.current_user.build_account(attributes_for(:account))
      @account.save
    end

    context "with valid attributes" do
      it "locates the requested account" do
        put :update, user_id: subject.current_user, account: attributes_for(:account)
        expect(assigns(:account)).to eq(@account)
      end

      it "updates the @account attributes" do
        put :update, user_id: subject.current_user, account: attributes_for(:account, first_name: "bob", last_name: "jones")
        @account.reload
        expect(@account.first_name).to eq("bob")
        expect(@account.last_name).to eq("jones")
      end

      it "re-directs to the updated account" do
        put :update, user_id: subject.current_user, account: attributes_for(:account)
        expect(response).to redirect_to user_account_path subject.current_user
      end
    end

    context "with invalid attributes" do
      it "locates the requested account" do
        put :update, user_id: subject.current_user, account: attributes_for(:invalid_account)
        expect(assigns(:account)).to eq(@account)
      end

      it "does not update @account attributes" do
        put :update, user_id: subject.current_user, account: attributes_for(:account, first_name: "jack", last_name: nil)
        @account.reload
        expect(@account.first_name).not_to eq("jack")
        expect(@account.last_name).not_to eq("jackson")
      end

      it "re-renders the edit method" do
        put :update, user_id: subject.current_user, account: attributes_for(:invalid_account)
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do

    before :each do
      @account = subject.current_user.build_account(attributes_for(:account))
      @account.save
    end

    it "deletes the account" do
      expect{
        delete :destroy, user_id: subject.current_user, account: attributes_for(:account)
      }.to change(Account, :count).by(-1)
    end

    it "redirects to accounts#index" do
      delete :destroy, user_id: subject.current_user, account: attributes_for(:account)
      expect(response).to redirect_to user_path subject.current_user
    end
  end

end
