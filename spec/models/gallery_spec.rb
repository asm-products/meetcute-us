require 'rails_helper'

RSpec.describe Gallery, :type => :model do
  it "should have a valid factory" do
    expect(build(:gallery)).to be_valid
  end
  
  it { should belong_to(:site) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
end
