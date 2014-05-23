require "spec_helper"

describe "/designs/new", :type => :feature do
  
  include RequestHelpers
  
  let!(:user) { admin_user }

  before { visit new_design_path }
  after { Warden.test_reset! }

  it "has a name field" do
    expect(page).to have_selector("#design_name")
  end

  it "has a description field" do
    expect(page).to have_selector("#design_description")
  end

  it "allows a Design to be created" do
    design = build(:design)
    fill_in "design[name]", :with => design.name
    fill_in "design[description]", :with => design.description
    click_button "Create"
    expect(page).to have_content "Design created successfully."
  end

  it "has an image file field"

end