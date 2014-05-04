require 'spec_helper'

describe Layout do

  it "has a valid factory" do
    expect(FactoryGirl.create(:layout)).to be_valid
  end
  
  it { should belong_to(:site) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
end
