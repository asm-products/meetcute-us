require 'rails_helper'

describe Event, :type => :model do
  it "should have a valid factory" do
    expect(create(:event)).to be_valid
  end

  it { is_expected.to belong_to(:site) }
  it { is_expected.to validate_presence_of(:date) }
  it { is_expected.to validate_presence_of(:title) }
end
