require "spec_helper"

describe LayoutPolicy do

  subject { LayoutPolicy }

  let(:user) { FactoryGirl.build(:user) }
  let(:admin_user) { FactoryGirl.build(:admin_user) }
  let(:layout) { FactoryGirl.build(:layout) }

  permissions :index? do
    it "Denies access if user is not an admin" do
      expect(subject).not_to permit(FactoryGirl.build(:user), FactoryGirl.build(:layout))
    end

    it "Grants accses if user is an admin" do
      expect(subject).to permit(admin_user, layout)
    end
  end
  
end