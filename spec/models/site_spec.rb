require 'spec_helper'

describe Site do
  subject(:site) { create(:site) }

  it "has a valid factory" do
    expect(site).to be_valid
  end

  it { should belong_to(:user) }
  it { should have_one(:design).through(:layout) }
  it { should have_many(:events) }
  it { should validate_presence_of(:subdomain) }
  it { should validate_uniqueness_of(:subdomain) }

  it "should destroy it's associated events" do
    create(:event, site: site)
    expect {
      site.destroy
    }.to change(Event, :count).by(-1)
  end

  it "Should be created with a default Layout" do
    expect(site.design.id).to eq(1)
  end
end
