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

  context "Adding stories" do
    before { new_story_path }

    it "Should allow a Story to be added" do
      fill_in "story[title]", :with => "My story tittle"
      fill_in "story[content]", :with => "My content"
      fill_in "story[display_order]", :with => 1
      click_button "Add Story"
      expect(page).to have_content "Your story has been created!"
      expect(user.site.stores.last.title).to eq("My story title")
    end
  end
end
