require 'rails_helper'

RSpec.describe GalleriesController, :type => :controller do
  login_user

  before(:each) do
    @site = create(:site, user: subject.current_user)
    @gallery = create(:gallery, site: @site)
  end

  describe "#index" do
    before { get :index }

    it "populates a list of all galleries" do
      expect(assigns(:galleries)).to include(@gallery)
    end

    it "renders the index view" do
      expect(response).to render_template :index
    end
  end

  describe "#new" do
    before { get :new }

    it "assigns a new gallery to @gallery" do
      expect(assigns(:gallery)).not_to be_nil
    end

    it "renders the new view" do
      expect(response).to render_template :new
    end
  end

  describe "#show" do
    before { get :show, id: @gallery }

    it "assigns the requested gallery to @gallery" do
      expect(assigns(:gallery)).to eq(@gallery)
    end

    it "renders the show view" do
      expect(response).to render_template :show
    end
  end

  describe "#edit" do
    before { get :edit, id: @gallery }

    it "assigns the request gallery to @gallery" do
      expect(assigns(:gallery)).to eq(@gallery)
    end

    it "renders the edit template" do
      expect(response).to render_template :edit
    end
  end

  describe "#create" do
    context "with valid attributes" do
      it "creates a new gallery" do
        expect {
          post :create, gallery: attributes_for(:gallery, site: @site)
        }.to change(Gallery, :count).by(1)
      end

      it "redirects to current_user.site.galleries" do
        post :create, gallery: attributes_for(:gallery, site: @site)
        expect(response).to redirect_to galleries_path
      end
    end

    context "with invalid attributes" do
      it "does not save an invalid gallery" do
        expect {
          post :create, gallery: attributes_for(:invalid_gallery, site: @site)
        }.to change(Gallery, :count).by(0)
      end

      it "re-renders #new" do
        post :create, gallery: attributes_for(:invalid_gallery, site: @site)
        expect(response).to render_template :new
      end
    end

    context "With nested images_attributes" do
      it "saves each image" do
        expect {
          post :create, gallery: attributes_for(:gallery, images_attributes: [build(:image)])
        }.to change(Gallery, :count).by(1)
      end
    end
  end

  describe "#update" do
    context "with valid attributes" do
      it "locates the requested gallery" do
        put :update, id: @gallery, gallery: attributes_for(:gallery)
        expect(assigns(:gallery)).to eq(@gallery)
      end

      it "updates the gallery attributes" do
        put :update, id: @gallery, gallery: attributes_for(:gallery, description: "testing")
        @gallery.reload
        expect(@gallery.description).to eq("testing")
      end

      it "redirects to current_user.site.galleries" do
        put :update, id: @gallery, gallery: attributes_for(:gallery)
        expect(response).to redirect_to galleries_path
      end
    end

    context "with invalid attributes" do
      it "does not update the gallery" do
        put :update, id: @gallery, gallery: attributes_for(:invalid_gallery, title: "test")
        @gallery.reload
        expect(@gallery.title).not_to eq("test")
      end
    end
  end
end
