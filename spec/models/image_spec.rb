require 'rails_helper'

RSpec.describe Image, :type => :model do
  it "should have a valid factory" do
    expect(build(:image)).to be_valid
  end

  it { should belong_to(:gallery) }
  it { is_expected.to validate_presence_of(:visible) }
end
