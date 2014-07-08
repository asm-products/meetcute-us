require 'rails_helper'

RSpec.describe EventsController, :type => :controller do
  login_user

  before(:each) do
    @site = create(:site, user: subject.current_user)
    @event = create(:event, site: @site)
  end

  describe "GET #index" do
    before { get :index }

    it "populates a list of all events" do
      expect(assigns(:events)).to include(@event)
    end

    it "renders the index view" do
      expect(response).to render_template :index
    end
  end

  describe "GET #new" do
    before { get :new }

    it "assigns a new event to @event" do
      expect(assigns(:event)).not_to be_nil
    end

    it "render the new view" do
      expect(response).to render_template :new
    end
  end

  describe "GET #show" do
    before { get :show, id: @event }

    it "assigns the requested event to @event" do
      expect(assigns(:event)).to eq(@event)
    end

    it "render the show view" do
      expect(response).to render_template :show
    end
  end

  describe "GET #edit" do
    before { get :edit, id: @event }

    it "assigns the requested Event to event" do
      expect(assigns(:event)).to eq(@event)
    end

    it "renders the edit view" do
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new event" do
        expect {
          post :create, event: attributes_for(:event, site: @site)
        }.to change(Event, :count).by(1)
      end

      it "redirects to current_user.site.events" do
        post :create, event: attributes_for(:event, site: @site)
        expect(response).to redirect_to events_path
      end
    end

    context 'with invalid attributes' do
      it "does not save an invalid event" do
        expect {
          post :create, event: attributes_for(:invalid_event, site: @site)
        }.to change(Event, :count).by(0)
      end

      it "re-renders the new method" do
        post :create, event: attributes_for(:invalid_event, site: @site)
        expect(response).to render_template :new
      end
    end
  end

  describe "PUT #update" do
    context "with valid attributes" do
      it "locates the requested event" do
        put :update, id: @event, event: attributes_for(:event)
        expect(assigns(:event)).to eq(@event)
      end

      it "updates the event attributes" do
        put :update, id: @event, event: attributes_for(:event, description: "test")
        @event.reload
        expect(@event.description).to eq("test")
      end

      it "re-directs to current_user.site.events" do
        put :update, id: @event, event: attributes_for(:event)
        expect(response).to redirect_to events_path
      end
    end

    context "with invalid attributes" do
      it "does not upate the plan attributes" do
        put :update, id: @event, event: attributes_for(:invalid_event, description: "test")
        @event.reload
        expect(@event.description).not_to eq("test")
      end

      it "re-renders the edit method" do
        put :update, id: @event, event: attributes_for(:invalid_event)
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the event" do
      expect {
        delete :destroy, id: @event
      }.to change(Event, :count).by(-1)
    end

    it "re-directs to current_user.site.events" do
      delete :destroy, id: @event
      expect(response).to redirect_to events_path
    end
  end
end
