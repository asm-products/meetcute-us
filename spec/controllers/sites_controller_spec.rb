require "spec_helper"

describe SitesController do
  login_user

  before :each do
    @site = subject.current_user.build_site(attributes_for(:site))
    @site.save
    request.host = "#{@site.subdomain}.lvh.me:3000"
  end

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
        site = attributes_for(:site)
        post :create, user_id: subject.current_user, site: site
        expect(subject.current_user.site.name).to eq(site[:name])
      end

      it "redirects to the new site" do
        post :create, user_id: subject.current_user, site: attributes_for(:site)
        expect(response).to redirect_to user_site_path subject.current_user
      end
    end

    context "with invalid attributes" do
      it "does not save an invalid site" do
        post :create, user_id: subject.current_user, site: attributes_for(:invalid_site)
        expect(subject.current_user.site).to_not be_valid
      end

      it "re-renders the new method" do
        post :create, user_id: subject.current_user, site: attributes_for(:invalid_site)
        expect(response).to render_template :new
      end
    end
  end

  describe "PUT #update" do

    it "locates the requested site" do
      get :edit, user_id: subject.current_user, site: attributes_for(:site)
      assigns(:site).should eq(@site)
    end

    context "with valid attributes" do

      it "updates the @site attributes" do
        put :update, user_id: subject.current_user, site: attributes_for(:site, name: "MyName")
        @site.reload
        expect(@site.name).to eql("MyName")
      end

      it "re-directs to the updated @site" do
        put :update, user_id: subject.current_user, site: attributes_for(:site, name: "MyName")
        expect(response).to redirect_to edit_user_site_path subject.current_user
      end
    end

    context "with invalid attributes" do
      it "does not update the @site attributes" do
        put :update, user_id: subject.current_user, site: attributes_for(:site, name: "MyName", subdomain: nil)
        @site.reload
        expect(@site.name).to_not eq("MyName")
      end

      it "re-renders the :edit template" do
        put :update, user_id: subject.current_user, site: attributes_for(:site, name: "MyName", subdomain: nil)
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do

    it "deletes the site" do
      expect {
        delete :destroy, user_id: subject.current_user, site: attributes_for(:site)
      }.to change(Site, :count).by(-1)
    end

    it "redirects to the users account" do
      delete :destroy, user_id: subject.current_user, site: attributes_for(:site)
      expect(response).to redirect_to user_account_path subject.current_user
    end
  end

end