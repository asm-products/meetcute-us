require 'spec_helper'

describe Event do
  it "should have a valid factory" do
    expect(create(:event)).to be_valid
  end
end
