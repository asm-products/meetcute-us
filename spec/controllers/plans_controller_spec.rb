require 'spec_helper'

describe PlansController do
  login_user
 
  before :each do
    @plan = FactoryGirl.create(:plan)
  end

  describe "GET #index" do
    it "populates a list of all plans" do
      get :index
      assigns(:plans).should include(@plan)
    end
    
    it "renders the index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #new" do
    it "assigns a new Plan to @plan" do
      get :new
      assigns(:plan).should_not be_nil
    end

    it "renders the :new view" do
      get :new
      response.should render_template :new
    end
  end

  describe "GET #show" do
    it "assigns the requested Plan to @plan" do
      get :show, id: @plan
      assigns(:plan).should_not be_nil
    end
    
    it "renders the :show view" do
      get :show, id: @plan
      response.should render_template :show
    end
  end

  describe "GET #edit" do
    it "assigns the requested Plan to @plan" do
      get :edit, id: @plan
      assigns(:plan).should eq(@plan)
    end
    
    it "renders the :edit view" do
      get :edit, id: @plan
      response.should render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new Plan" do
        expect{
          post :create, plan: FactoryGirl.attributes_for(:plan)
        }.to change(Plan, :count).by(1)
      end
      
      it "redirects to current_user.subscriptions" do
          post :create, plan: FactoryGirl.attributes_for(:plan)
          response.should redirect_to user_subscriptions_path subject.current_user
      end
    end

    context "with invalid attributes" do
      it "does not save an invalid Plan" do
        expect{
          post :create, plan: FactoryGirl.attributes_for(:plan, amount: nil)
        }.to_not change(Plan, :count).by(1)
      end

      it "re-renders the new method" do
        post :create, plan: FactoryGirl.attributes_for(:plan, amount: nil)
        response.should render_template :new
      end
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      it "locates the requested Plan" do
        put :update, id: @plan, plan: FactoryGirl.attributes_for(:plan)
        assigns(:plan).should eq(@plan)      
      end
      
      it "updates the Plan attributes" do
        put :update, id: @plan, plan: FactoryGirl.attributes_for(:plan, name: "tester")
        @plan.reload
        @plan.name.should eq("tester")
      end
      
      it "re-directs to current_user.subscriptions" do
        put :update, id: @plan, plan: FactoryGirl.attributes_for(:plan, name: "tester")
        response.should redirect_to user_subscriptions_path subject.current_user
      end
    end

    context "with invalid attributes" do
      it "locates the requested Plan" do
        put :update, id: @plan, plan: FactoryGirl.attributes_for(:plan)
        assigns(:plan).should eq(@plan)      
      end

      it "Does not update the Plan attributes" do
        put :update, id: @plan, plan: FactoryGirl.attributes_for(:invalid_plan, name: "testy")
        @plan.reload
        @plan.name.should_not eq("testy")
      end
      
      it "re-renders the edit method" do
        put :update, id: @plan, plan: FactoryGirl.attributes_for(:invalid_plan)
        response.should render_template :edit
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
      response.should redirect_to user_subscriptions_path subject.current_user
    end
  end

end
