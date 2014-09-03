require 'rails_helper'

RSpec.describe Gallery, :type => :model do
  it "should have a valid factory" do
    expect(build(:gallery)).to be_valid
  end
  
  it { should belong_to(:site) }
end
