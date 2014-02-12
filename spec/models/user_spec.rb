require 'spec_helper'

describe User do
  let!(:user) {FactoryGirl.create(:user)}

  it "has a user_info_id" do
    expect(user.user_info_id).to eq(1)
  end

  it "has an email address" do
    expect(user.email).to eq(user.email)
  end

  it "has a password" do
    expect(user.password).to eq("secret1234")
  end

end