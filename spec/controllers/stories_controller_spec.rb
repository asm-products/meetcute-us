require 'rails_helper'

RSpec.describe StoriesController, :type => :controller do
  login_user

  before(:each) do
    @site = create(:site, user: subject.current_user)
    @story = create(:story, site: @site)
  end

  describe "GET #index" do
	before { get :index }

	it "populates a list of all stories" do
      expect(assigns(:stories)).to include(@story)
	end

	it "renders the index view" do
      expect(response).to render_template :index
	end
  end

  describe "GET #new" do
	before { get :new }

	it "assigns a new story to @story" do
	  expect(assigns(:story)).not_to be_nil
	end

	it "renders the new template" do
	  expect(response).to render_template :new
	end
  end

  describe "GET #show" do
	before { get :show, id: @story }

	it "assigns the requested story to @story" do
	  expect(assigns(:story)).to eq(@story)
	end

	it "renders the show template" do
      expect(response).to render_template :show
	end
  end

  describe "GET #edit" do 
	before { get :edit, id: @story }

	it "assigns the requested story to @story" do
      expect(assigns(:story)).to eq(@story)
	end

	it "renders the edit view" do
	  expect(response).to render_template :edit
	end
  end

end
