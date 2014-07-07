require 'rails_helper'

describe SitePolicy do

  subject { SitePolicy }

  let(:user) { build(:user) }
  let(:admin_user) { build(:admin_user) }
  let(:site) { build(:site) }

  permissions :index? do
    it "denies access if user is not an admin" do
      expect(subject).not_to permit(user, site)
    end

    it "grants accss if user is an admin" do
      expect(subject).to permit(admin_user, site)
    end
  end
end