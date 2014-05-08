require 'spec_helper'

describe Site do
  subject(:site) { create(:site) }
  

  it "has a valid factore" do
    expect(site).to be_valid
  end

  it { should belong_to(:user) }
  it { should have_one(:design) }
  it { should validate_presence_of(:subdomain) }

end
