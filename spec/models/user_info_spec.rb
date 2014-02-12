require 'spec_helper'

describe UserInfo do
  let!(:user_info) { FactoryGirl.create(:user_info)}

  it "has a user_id" do
    expect(user_info.user_id).to eq 1
  end

  it "has a first_name" do
    expect(user_info.username).to eq "MyString"
  end

  it "has a last_name" do
    expect(user_info.last_name).to eq "MyString"
  end

  it "has a username" do
    expect(user_info.username).to eq "MyString"
  end

  it "has a stripe_customer_token" do
    expect(user_info.stripe_customer_token).to eq "MyString"
  end

  it "has a wedding_date" do
    # expect(user_info.wedding_date).to eq("Wed, 12 Feb 2014")
  end

  it "has a subscription_id" do
    expect(user_info.subscription_id).to eq 1
  end

  it "has a site_id" do
    expect(user_info.site_id).to eq 1
  end
end