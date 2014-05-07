require 'spec_helper'

describe DesignsController do
  login_admin
  
  before :each do
    @design = FactoryGirl.create(:design)
  end
  
  describe "GET #index" do
    it "assigns all designs to @designs" do
      get :index
      expect(assigns(:designs)).to_not be_nil
    end
  end

  describe "GET #new" do
    it "assigns a new design to @design" do
      get :new
      expect(assigns(:design)).to be_a Design
    end
    
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #show" do
    

    it "assigns the requested Design to @design" do
      get :show, id: @design
      expect(assigns(:design)).to eq(@design)
    end

    it "renders the :show template" do
      get :show, id: @design
      expect(response).to render_template :show
    end
  end

  describe "GET #edit" do
    it "assigns the requested Design to @design" do 
      get :edit, id: @design
      expect(assigns(:design)).to eq(@design)
    end

    it "renders the :edit template" do
      get :edit, id: @design
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
  
    context "with valid attributes" do
      it "creates a new Design" do
        expect {
          post :create, design: FactoryGirl.attributes_for(:design)
        }.to change(Design, :count).by(1)
      end
      
      it "redirects to the new Design" do
        post :create, design: FactoryGirl.attributes_for(:design)
        expect(response).to redirect_to design_path Design.last
      end
    end

    context "with invalid attributes" do
      it "does not create a new Design" do
        expect {
          post :create, design: FactoryGirl.attributes_for(:design, name: nil)
        }.to change(Design, :count).by(0)
      end
      
      it "re-renders the :new template" do
        post :create, design: FactoryGirl.attributes_for(:design, name: nil)
        expect(response).to render_template :new
      end
    end
  end

  describe "PUT #update" do
    it "locates the requested Design" do
      get :edit, id: @design
      expect(assigns(:design)).to eq(@design)
    end

    context "with valid attributes" do
      it "updates the @design attributes" do
        put :update, id: @design, design: FactoryGirl.attributes_for(:design, name: "Test")
        @design.reload
        expect(@design.name).to eq("Test") 
      end
      
      it "redirects to the updated Design" do
        put :update, id: @design, design: FactoryGirl.attributes_for(:design, name: "Test")
        expect(response).to redirect_to design_path @design
      end
    end

    context "with invalid attributes" do
      it "does not update the @design attributes" do
        put :update, id: @design, design: FactoryGirl.attributes_for(:design, name: nil, description: "NO DICE")
        expect(@design.description).to_not eq("NO DICE")
      end
      
      it "re-renders the :edit template" do
        put :update, id: @design, design: FactoryGirl.attributes_for(:design, name: nil, description: "NO DICE")
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    it "delets the Design" do
      expect {
        delete :destroy, id: @design
      }.to change(Design, :count).by(-1)
    end

    it "redirects to designs#index" do
      delete :destroy, id: @design
      expect(response).to redirect_to designs_path
    end
  end

end
