require 'rails_helper'

RSpec.describe Story, :type => :model do

  it "has a valid factory" do
	expect(build(:story)).to be_valid
  end

  it { is_expected.to belong_to(:site) }
  it { is_expected.to validate_presence_of(:title) }

end
