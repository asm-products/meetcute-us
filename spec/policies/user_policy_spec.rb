require "spec_helper"

describe UserPolicy do

  subject { UserPolicy }

  permissions :index? do
    it "Denies access if user is not an admin" do
      expect(subject).not_to permit(build(:user), build(:user))
    end

    it "Grants accses if user is an admin" do
      expect(subject).to permit(build(:admin_user), build(:user))
    end
  end
  
end