require 'spec_helper'

describe Account do
  let!(:account) { FactoryGirl.create(:account)}

  it "has a user_id" do
    expect(account.user_id).to eq 1
  end

  it "has a first_name" do
    expect(account.username).to eq "MyString"
  end

  it "has a last_name" do
    expect(account.last_name).to eq "MyString"
  end

  it "has a username" do
    expect(account.username).to eq "MyString"
  end

  it "has a stripe_customer_token" do
    expect(account.stripe_customer_token).to eq "MyString"
  end

  it "has a wedding_date" do
    # expect(account.wedding_date).to eq("Wed, 12 Feb 2014")
  end

  it "has a subscription_id" do
    expect(account.subscription_id).to eq 1
  end

  it "has a site_id" do
    expect(account.site_id).to eq 1
  end
end