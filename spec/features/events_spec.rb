require 'rails_helper'

describe "Site events", :type => :feature do
  include RequestHelpers

  let!(:user) { user_with_account_site }

  after { Warden.test_reset! }

  context "Viewing events" do
    before do
      @event = create(:event, site: user.site)
      visit events_path
    end

    it "should list all events" do
      expect(page).to have_content(@event.title)
    end

    it "should have a link to add an event" do
      click_link "New Event"
      expect(page).to have_content("New Event")
    end

    it "should have edit links for each event" do
      click_link "Edit"
      expect(page).to have_content(@event.description)
    end
  end

  context "Adding events" do
    before { visit new_event_path }

    it "should have the site_id field" do
      expect(page).to have_selector("#event_site_id")
    end

    it "should have a title field" do
      expect(page).to have_selector("#event_title")
    end

    it "should have a date field" do
      expect(page).to have_selector("#event_date")
    end

    it "should have a description field" do
      expect(page).to have_selector("#event_description")
    end

    it "should allow an event to be added" do
      fill_in "event[title]", :with => "My Event Title"
      fill_in "event[description]", :with => "unde, commodi veritatis explicabo!"
      fill_in "event[date]", :with => DateTime.parse("Jan 12, 2015")
      click_button "Add Event"
      expect(page).to have_content "Your event has been created!"
      expect(user.site.events.last.title).to eq("My Event Title")
    end
  end

end