require 'spec_helper'

describe SubscriptionsController do
  login_user

  before :each do
    @subscription = subject.current_user.subscriptions.build(FactoryGirl.attributes_for(:subscription))
    @subscription.save
  end

  describe "GET #index" do
    it "populates a list of all subscriptions" do
      get :index, user_id: subject.current_user
      assigns(:subscriptions).should include(@subscription)
    end

    it "renders the index view" do
      get :index, user_id: subject.current_user
      response.should render_template :index
    end
  end

  describe "GET #new" do
    it "assigns a new Subscriptions to @subscription" do
      get :new, user_id: subject.current_user
      assigns(:subscription).should_not be_nil
    end
    
    it "renders the new template" do
      get :new, user_id: subject.current_user
      response.should render_template :new
    end
  end

  describe "GET #show" do
    it "assigns the requested subscriptions to @subscription" do
      get :show, id: @subscription
      assigns(:subscription).should_not be_nil
    end
    
    it "renders the :show view" do
      get :show, id: @subscription
      response.should render_template :show
    end
  end

  describe "GET #edit" do
    it "assigns the requested subscription to @subscription" do
      get :edit, id: @subscription
      assigns(:subscription).should eq(@subscription)
    end
  end

  describe "POST #create" do
    context "with valid attributs" do

      before { StripeMock.start }
      after { StripeMock.stop } 
      
      it "creates a new subscription" do
        expect{
          post :create, 
            user_id: subject.current_user, 
            subscription: FactoryGirl.attributes_for(:subscription),
            stripe_customer_token: StripeMock.generate_card_token(last4: "9191", exp_year: 2015)

        }.to change(Subscription, :count).by(1)
      end
      
      it "redirects to the new subscription" do
        post :create, 
          user_id: subject.current_user, 
          subscription: FactoryGirl.attributes_for(:subscription),
          stripe_customer_token: StripeMock.generate_card_token(last4: "9191", exp_year: 2015)
        
        response.should redirect_to Subscription.last
      end
    end

    context "with invalid attributs" do
      it "does not save an invalid subscription" do
        expect{
          post :create, user_id: subject.current_user, subscription: FactoryGirl.attributes_for(:invalid_subscription)
        }.to_not change(Subscription, :count).by(1)
      end
      
      it "re-renders the new method" do
        post :create, user_id: subject.current_user, subscription: FactoryGirl.attributes_for(:invalid_subscription)
        response.should render_template :new
      end
      
    end
  end

  describe "PUT #update" do
    before :each do
      @subscription = FactoryGirl.create(:subscription, user_id: subject.current_user.id, plan_id: "myString")
    end

    context "with valid attributs" do
      it "locates the requested subscription" do
        put :update, id: @subscription, subscription: FactoryGirl.attributes_for(:subscription)
        assigns(:subscription).should eq(@subscription)
      end

      it "updates the subscription attributes" do
        put :update, id: @subscription, subscription: FactoryGirl.attributes_for(:subscription, plan_id: "myPlanId")
        @subscription.reload
        @subscription.plan_id.should eq("myPlanId")
      end

      it "re-directs to the updated subscription" do
        put :update, id: @subscription, subscription: FactoryGirl.attributes_for(:subscription)
        response.should redirect_to @subscription
      end
    end

    context "with invalid attributes" do
      it "locates the requested subscription" do
        put :update, id: @subscription, subscription: FactoryGirl.attributes_for(:subscription)
        assigns(:subscription).should eq(@subscription)
      end

      it "does not update @subscription attributes" do
        put :update, id: @subscription, subscription: FactoryGirl.attributes_for(:invalid_subscription)
        @subscription.reload
        @subscription.plan_id.should_not be_nil
      end
      
      it "re-renders the edit method" do
        put :update, id: @subscription, subscription: FactoryGirl.attributes_for(:invalid_subscription)
        response.should render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @subscription = FactoryGirl.create(:subscription, user_id: subject.current_user.id, plan_id: "myString")
    end

    it "deletes the subscription" do
      expect{
        delete :destroy, id: @subscription 
      }.to change(Subscription, :count).by(-1)
    end
    
    it "redirects to subscriptions#index" do
      delete :destroy, id: @subscription
      response.should redirect_to user_subscriptions_path subject.current_user
    end
  end

end
