require "spec_helper"

describe UserPolicy do

  subject { UserPolicy }

  permissions :index? do
    it "Denies access if user is not an admin" do
      expect(subject).not_to permit(FactoryGirl.build(:user), FactoryGirl.build(:user))
    end

    it "Grants accses if user is an admin" do
      expect(subject).to permit(FactoryGirl.build(:admin_user), FactoryGirl.build(:user))
    end
  end
  
end