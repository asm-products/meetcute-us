require "spec_helper"

describe LayoutPolicy do

  subject { LayoutPolicy }

  let(:user) { FactoryGirl.build(:user) }
  let(:admin_user) { FactoryGirl.build(:admin_user) }
  let(:layout) { FactoryGirl.build(:layout) }

  [:index?, :create?, :update?, :destroy?, :edit?].each do |action|
    permissions action do
      it "denies access if user is not an admin" do
        expect(subject).not_to permit(user, layout)
      end

      it "grants accses if user is an admin" do
        expect(subject).to permit(admin_user, layout)
      end
    end
  end

end