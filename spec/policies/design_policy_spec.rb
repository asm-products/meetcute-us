require "spec_helper"

describe DesignPolicy do

  subject { DesignPolicy }

  let(:user) { FactoryGirl.build(:user) }
  let(:admin_user) { FactoryGirl.build(:admin_user) }
  let(:design) { FactoryGirl.build(:design) }

  [:index?, :create?, :update?, :destroy?, :edit?].each do |action|
    permissions action do
      it "denies access if user is not an admin" do
        expect(subject).not_to permit(user, design)
      end

      it "grants accses if user is an admin" do
        expect(subject).to permit(admin_user, design)
      end
    end
  end

end