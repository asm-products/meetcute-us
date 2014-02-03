require 'spec_helper'

describe User do
  let!(:user) {FactoryGirl.create(:user)}
  
  it "has a site_id" do
    expect(user.site_id).to eq(1)
  end

  it "has a user_info_id" do
    expect(user.user_info_id).to eq(1)
  end

  it "has a subscription_id" do
    expect(user.subscription_id).to eq(1)
  end

  it "has a usename" do
    expect(user.username).to eq("test")
  end

  it "has an email address" do
    expect(user.email).to eq("test@test")
  end

  it "has a password" do
    expect(user.password).to eq("secret1234")
  end

end