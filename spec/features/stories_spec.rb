require 'rails_helper'

describe "Site stories", :type => :feature do
  include RequestHelpers

  let!(:user) { user_with_account_site }

  after { Warden.test_reset! }

  context "Viewing stories" do
	before do
	  @story = create(:story, site: user.site)
	  visit stories_path
	end

	it "should list all stories" do
	  expect(page).to have_content(@story.title)
	end
  end
end
