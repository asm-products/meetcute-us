require 'rails_helper'

RSpec.describe "User Gallery", :type => :feature do
  include RequestHelpers

  let!(:user) { user_with_account_site }

  before { visit new_gallery_path }
  after { Warden.test_reset! }

  it "allows a gallery to be created" do
    @gallery = build(:gallery)
    fill_in "gallery[title]", :with => @gallery.title
    fill_in "gallery[description]", :with => @gallery.description
    attach_file "gallery[images_attributes][0][image]", "./spec/support/store/carrierwave_test.gif"
    click_button "Add Gallery"
    expect(page).to have_content "Gallery created successfully"
  end
end
