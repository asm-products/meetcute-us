require 'rails_helper'

describe PlansController, :type => :controller do
  login_user

  before :each do
    @plan = create(:plan)
  end

  describe "GET #index" do
    it "populates a list of all plans" do
      get :index
      expect(assigns(:plans)).to include(@plan)
    end

    it "renders the index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #new" do
    it "assigns a new Plan to @plan" do
      get :new
      expect(assigns(:plan)).not_to be_nil
    end

    it "renders the :new view" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #show" do
    it "assigns the requested Plan to @plan" do
      get :show, id: @plan
      expect(assigns(:plan)).not_to be_nil
    end

    it "renders the :show view" do
      get :show, id: @plan
      expect(response).to render_template :show
    end
  end

  describe "GET #edit" do
    it "assigns the requested Plan to @plan" do
      get :edit, id: @plan
      expect(assigns(:plan)).to eq(@plan)
    end

    it "renders the :edit view" do
      get :edit, id: @plan
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new Plan" do
        expect{
          post :create, plan: attributes_for(:plan)
        }.to change(Plan, :count).by(1)
      end

      it "redirects to current_user.subscriptions" do
          post :create, plan: attributes_for(:plan)
          expect(response).to redirect_to user_subscriptions_path subject.current_user
      end
    end

    context "with invalid attributes" do
      it "does not save an invalid Plan" do
        expect{
          post :create, plan: attributes_for(:plan, amount: nil)
        }.to change(Plan, :count).by(0)
      end

      it "re-renders the new method" do
        post :create, plan: attributes_for(:plan, amount: nil)
        expect(response).to render_template :new
      end
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      it "locates the requested Plan" do
        put :update, id: @plan, plan: attributes_for(:plan)
        expect(assigns(:plan)).to eq(@plan)
      end

      it "updates the Plan attributes" do
        put :update, id: @plan, plan: attributes_for(:plan, name: "tester")
        @plan.reload
        expect(@plan.name).to eq("tester")
      end

      it "re-directs to current_user.subscriptions" do
        put :update, id: @plan, plan: attributes_for(:plan, name: "tester")
        expect(response).to redirect_to user_subscriptions_path subject.current_user
      end
    end

    context "with invalid attributes" do
      it "locates the requested Plan" do
        put :update, id: @plan, plan: attributes_for(:plan)
        expect(assigns(:plan)).to eq(@plan)
      end

      it "Does not update the Plan attributes" do
        put :update, id: @plan, plan: attributes_for(:invalid_plan, name: "testy")
        @plan.reload
        expect(@plan.name).not_to eq("testy")
      end

      it "re-renders the edit method" do
        put :update, id: @plan, plan: attributes_for(:invalid_plan)
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the Plan" do
      expect{
        delete :destroy, id: @plan
      }.to change(Plan, :count).by(-1)
    end

    it "re-directs to current_user.subscriptions" do
      delete :destroy, id: @plan
      expect(response).to redirect_to user_subscriptions_path subject.current_user
    end
  end

end
