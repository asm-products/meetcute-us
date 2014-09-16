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

  context "Editing events" do
    before do
      @event = create(:event, site: user.site)
      visit edit_event_path(@event)
    end

    it "should allow an event to be updated" do
      fill_in "event[title]", :with => "My New Title"
      fill_in "event[description]", :with => "My awesome description"
      select "January", :from => "event_date_2i"
      click_button "Update Event"
      expect(page).to have_content "Your event has been updated!"
      expect(user.site.events.last.title).to eq("My New Title")
    end
  end

  context "Adding events" do
    before { visit new_event_path }

    it "should allow an event to be added" do
      fill_in "event[title]", :with => "My Event Title"
      fill_in "event[description]", :with => "unde, commodi veritatis explicabo!"
      select "January", :from => "event_date_2i"
      click_button "Add Event"
      expect(page).to have_content "Your event has been created!"
      expect(user.site.events.last.title).to eq("My Event Title")
    end
  end

end
