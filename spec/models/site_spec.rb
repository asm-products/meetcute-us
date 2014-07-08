require 'rails_helper'

describe Site, :type => :model do
  subject(:site) { create(:site) }

  it "has a valid factory" do
    expect(site).to be_valid
  end

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_one(:design).through(:layout) }
  it { is_expected.to have_many(:events) }
  it { is_expected.to validate_presence_of(:subdomain) }
  it { is_expected.to validate_uniqueness_of(:subdomain) }

  it "should destroy it's associated events" do
    create(:event, site: site)
    expect {
      site.destroy
    }.to change(Event, :count).by(-1)
  end

  it "Should be created with a default Design" do
    expect(site.design.id).to eq(1)
  end
end
