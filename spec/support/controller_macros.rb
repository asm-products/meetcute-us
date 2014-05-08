module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in create(:admin_user)
    end
  end

  def login_bronze_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = create(:bronze_user)
      sign_in user
    end
  end

  def login_silver_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in create(:silver_user)
    end
  end

  def login_gold_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in create(:gold_user)
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = create(:user)
      sign_in user
    end
  end

  def mock_stripe_plans
    before(:each) do
      Stripe::Plan.create(id: "test_plan")
    end
  end
end