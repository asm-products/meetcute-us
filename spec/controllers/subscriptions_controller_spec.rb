require 'rails_helper'

describe SubscriptionsController, :type => :controller do
  login_user

  before :each do
    @subscription = subject.current_user.subscriptions.build(attributes_for(:subscription))
    @subscription.save
  end

  describe "GET #index" do
    it "populates a list of all subscriptions" do
      get :index, user_id: subject.current_user
      expect(assigns(:subscriptions)).to include(@subscription)
    end

    it "renders the index view" do
      get :index, user_id: subject.current_user
      expect(response).to render_template :index
    end
  end

  describe "GET #new" do
    before { @plan = create(:plan) }

    it "assigns a new Subscriptions to @subscription" do
      get :new, user_id: subject.current_user, plan_id: @plan.id
      expect(assigns(:subscription)).not_to be_nil
    end
    
    it "renders the new template" do
      get :new, user_id: subject.current_user, plan_id: @plan.id
      expect(response).to render_template :new
    end
  end

  describe "GET #show" do
    it "assigns the requested subscriptions to @subscription" do
      get :show, id: @subscription
      expect(assigns(:subscription)).not_to be_nil
    end
    
    it "renders the :show view" do
      get :show, id: @subscription
      expect(response).to render_template :show
    end
  end

  describe "GET #edit" do
    it "assigns the requested subscription to @subscription" do
      get :edit, id: @subscription
      expect(assigns(:subscription)).to eq(@subscription)
    end
  end

  describe "POST #create" do
    context "with valid attributs" do

      before :each do
        StripeMock.start 
        @plan = Stripe::Plan.create(id: "test_plan")
        @card = StripeMock.generate_card_token(last4: "9191", exp_year: 2015)
      end 
      
      after { StripeMock.stop } 
      
      it "creates a new subscription" do
        expect{
          post :create, 
            user_id: subject.current_user, 
            subscription: attributes_for(:subscription, plan_id: @plan.id, stripe_card_token: @card)
        }.to change(Subscription, :count).by(1)
      end
      
      it "redirects to the new subscription" do
        post :create, 
          user_id: subject.current_user, 
          subscription: attributes_for(:subscription, plan_id: @plan.id, stripe_card_token: @card)
        
        expect(response).to redirect_to Subscription.last
      end
    end

    context "with invalid attributs" do
      # it "does not save an invalid subscription" do
      #   expect{
      #     post :create, user_id: subject.current_user, subscription: attributes_for(:invalid_subscription)
      #   }.to_not change(Subscription, :count).by(1)
      # end
      
      it "re-renders the new method" do
        post :create, user_id: subject.current_user, subscription: attributes_for(:invalid_subscription)
        expect(response).to render_template :new
      end
      
    end
  end

  describe "PUT #update" do
    before :each do
      @subscription = create(:subscription, user_id: subject.current_user.id, plan_id: "myString")
    end

    context "with valid attributs" do
      it "locates the requested subscription" do
        put :update, id: @subscription, subscription: attributes_for(:subscription)
        expect(assigns(:subscription)).to eq(@subscription)
      end

      it "updates the subscription attributes" do
        put :update, id: @subscription, subscription: attributes_for(:subscription, plan_id: "myPlanId")
        @subscription.reload
        expect(@subscription.plan_id).to eq("myPlanId")
      end

      it "re-directs to the updated subscription" do
        put :update, id: @subscription, subscription: attributes_for(:subscription)
        expect(response).to redirect_to @subscription
      end
    end

    context "with invalid attributes" do
      it "locates the requested subscription" do
        put :update, id: @subscription, subscription: attributes_for(:subscription)
        expect(assigns(:subscription)).to eq(@subscription)
      end

      it "does not update @subscription attributes" do
        put :update, id: @subscription, subscription: attributes_for(:invalid_subscription)
        @subscription.reload
        expect(@subscription.plan_id).not_to be_nil
      end
      
      it "re-renders the edit method" do
        put :update, id: @subscription, subscription: attributes_for(:invalid_subscription)
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @subscription = create(:subscription, user_id: subject.current_user.id, plan_id: "myString")
    end

    it "deletes the subscription" do
      expect{
        delete :destroy, id: @subscription 
      }.to change(Subscription, :count).by(-1)
    end
    
    it "redirects to subscriptions#index" do
      delete :destroy, id: @subscription
      expect(response).to redirect_to user_subscriptions_path subject.current_user
    end
  end

end
