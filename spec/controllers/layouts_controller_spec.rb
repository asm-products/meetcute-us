require 'spec_helper'

describe LayoutsController do
  login_admin
  
  before :each do
    @layout = FactoryGirl.create(:layout)
  end
  
  describe "GET #index" do
    it "assigns all layouts to @layouts" do
      get :index
      expect(assigns(:layouts)).to_not be_nil
    end
  end

  describe "GET #new" do
    it "assigns a new layout to @layout" do
      get :new
      expect(assigns(:layout)).to be_a Layout
    end
    
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #show" do
    

    it "assigns the requested Layout to @layout" do
      get :show, id: @layout
      expect(assigns(:layout)).to eq(@layout)
    end

    it "renders the :show template" do
      get :show, id: @layout
      expect(response).to render_template :show
    end
  end

  describe "GET #edit" do
    it "assigns the requested Layout to @layout" do 
      get :edit, id: @layout
      expect(assigns(:layout)).to eq(@layout)
    end

    it "renders the :edit template" do
      get :edit, id: @layout
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
  
    context "with valid attributes" do
      it "creates a new Layout" do
        expect {
          post :create, layout: FactoryGirl.attributes_for(:layout)
        }.to change(Layout, :count).by(1)
      end
      
      it "redirects to the new Layout" do
        post :create, layout: FactoryGirl.attributes_for(:layout)
        expect(response).to redirect_to layout_path Layout.last
      end
    end

    context "with invalid attributes" do
      it "does not create a new Layout" do
        expect {
          post :create, layout: FactoryGirl.attributes_for(:layout, name: nil)
        }.to change(Layout, :count).by(0)
      end
      
      it "re-renders the :new template" do
        post :create, layout: FactoryGirl.attributes_for(:layout, name: nil)
        expect(response).to render_template :new
      end
    end
  end

  describe "PUT #update" do
    it "locates the requested Layout" do
      get :edit, id: @layout
      expect(assigns(:layout)).to eq(@layout)
    end

    context "with valid attributes" do
      it "updates the @layout attributes" do
        put :update, id: @layout, layout: FactoryGirl.attributes_for(:layout, name: "Test")
        @layout.reload
        expect(@layout.name).to eq("Test") 
      end
      
      it "redirects to the updated Layout" do
        put :update, id: @layout, layout: FactoryGirl.attributes_for(:layout, name: "Test")
        expect(response).to redirect_to layout_path @layout
      end
    end

    context "with invalid attributes" do
      it "does not update the @layout attributes" do
        put :update, id: @layout, layout: FactoryGirl.attributes_for(:layout, name: nil, description: "NO DICE")
        expect(@layout.description).to_not eq("NO DICE")
      end
      
      it "re-renders the :edit template" do
        put :update, id: @layout, layout: FactoryGirl.attributes_for(:layout, name: nil, description: "NO DICE")
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    it "delets the Layout" do
      expect {
        delete :destroy, id: @layout
      }.to change(Layout, :count).by(-1)
    end

    it "redirects to layouts#index" do
      delete :destroy, id: @layout
      expect(response).to redirect_to layouts_path
    end
  end

end
