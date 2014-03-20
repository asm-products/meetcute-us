module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in FactoryGirl.create(:admin_user)
    end
  end

  def login_bronze_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:bronze_user)
      puts user.inspect
      sign_in user
    end
  end

  def login_silver_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in FactoryGirl.create(:silver_user)
    end
  end

  def login_gold_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in FactoryGirl.create(:gold_user)
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      sign_in user
    end
  end

  def mock_stripe_plans
    before(:each) do
      Stripe::Plan.create(id: "test_plan")
    end
  end
end