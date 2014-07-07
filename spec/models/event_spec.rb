require 'rails_helper'

describe Event do
  it "should have a valid factory" do
    expect(create(:event)).to be_valid
  end

  it { should belong_to(:site) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:title) }
end
