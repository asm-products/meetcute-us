require 'rails_helper'

describe "Main page" do
  
  it "should have a link to sign in" do
      visit root_path
      expect(page).to have_content "Sign In"
  end

  it "should have a link to sign up" do
    visit root_path
    expect(page).to have_content "Free Trial"
  end

end