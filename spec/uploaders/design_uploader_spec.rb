require 'spec_helper'

describe DesignUploader do
  include CarrierWave::Test::Matchers

  before do
    DesignUploader.enable_processing = true
    design = build(:design)
    @uploader = DesignUploader.new(design, :image)
    @uploader.store!(File.open(File.join(File.dirname(__FILE__), "../support/store/carrierwave_test.gif")))
  end

  after do
    DesignUploader.enable_processing = false
    @uploader.remove!
  end

  it "should scale the image to be exactly 200x200" do
    expect(@uploader).to have_dimensions(200, 200)
  end
end