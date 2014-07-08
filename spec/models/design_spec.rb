require 'rails_helper'

describe Design, :type => :model do

  it "has a valid factory" do
    expect(create(:design)).to be_valid
  end

  it { is_expected.to have_one(:site) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
end
