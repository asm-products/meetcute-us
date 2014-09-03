require 'rails_helper'

RSpec.describe "User Gallery", :type => :feature do
  include RequestHelpers

  let!(:user) { admin_user }

  before { visit new_gallery_path }
  after { Warden.test_reset! }

  it "allows a gallery to be created" do
    gallery = build(:gallery)
    fill_in "gallery[title]", :with => gallery.title
    fill_in "gallery[description]", :with => gallery.description
    click_button "Add Gallery"
    expect(page).to have_content "Gallery created successfully"
  end
end
