require "spec_helper"

describe SitesController do
  login_user

  describe "GET #new" do
    it "assigns a new Site to @site" do
      get :new, user_id: subject.current_user
      expect(assigns(:site)).to_not be_nil
    end

    it "renders the :new template" do
      get :new, user_id: subject.current_user
      expect(response).to render_template :new
    end
  end

  describe "GET #show" do
  
    before :each do
      @site = subject.current_user.build_site(FactoryGirl.attributes_for(:site))
      @site.save
    end
  
    it "assigns the requested site to @site" do
      get :show, id: @site, user_id: subject.current_user
      expect(assigns(:site)).to eq(@site)
    end
    
    it "renders the :show template" do
      get :show, id: @site, user_id: subject.current_user
      expect(response).to render_template :show
    end
  end

  describe "GET #edit" do
    it "assigns the requested site to @site" do
      get :edit, id: @site, user_id: subject.current_user
      expect(assigns(:site)).to eq(@site)
    end
  end

  describe "POST #create" do
    
    context "with valid attributes" do
      it "creates a new site" do
        expect {
          post :create, user_id: subject.current_user, site: FactoryGirl.attributes_for(:site)
        }.to change(Site, :count).by(1)
      end
      
      it "redirects to the new site" do
        post :create, user_id: subject.current_user, site: FactoryGirl.attributes_for(:site)
        expect(response).to redirect_to user_site_path subject.current_user
      end
    end

    context "with invalid attributes" do
      it "does not save an invalid site" do
        
      end
      
      it "re-renders the new method"
    end
  end
end