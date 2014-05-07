require "spec_helper"
 
 describe "User site", :type => :feature do

  include RequestHelpers

  describe "GET /users/:user_id/site/edit" do
    
    let!(:user) { user_with_account_site }

    before { visit edit_user_site_path(user) }
    after { Warden.test_reset! }

    it "should have a name field" do
      expect(page).to have_selector("#site_name")
    end
    
    it "should have a description field" do
      expect(page).to have_selector("#site_description")
    end
    
    it "should have a subdomain field" do
      expect(page).to have_selector("#site_subdomain")
    end
    
    it "should have a analytics field" do
      expect(page).to have_selector("#site_analytics")
    end

    it "should have a password_protected checkbox" do
      expect(page).to have_selector("#site_password_protected")
    end
    
    it "should have a is_indexed checkbox" do
      expect(page).to have_selector("#site_is_indexed")
    end

    it "should have a design dropdown" do
      expect(page).to have_selector("#site_design")
    end

    it "allows a user to update their site" do
      fill_in "site[name]", :with => "MyName"
      fill_in "site[description]", :with => user.site.description
      fill_in "site[subdomain]", :with => user.site.subdomain
      fill_in "site[analytics]", :with => user.site.analytics
      check "site[password_protected]"
      check "site[is_indexed]"
      click_button "Update"
      expect(page).to have_content "You updated your site successfully!"
      expect(User.last.site.name).to eq("MyName")
    end

  end

 end