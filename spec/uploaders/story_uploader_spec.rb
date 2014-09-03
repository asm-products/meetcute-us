require 'rails_helper'

describe StoryUploader do
  include CarrierWave::Test::Matchers

  before do
    StoryUploader.enable_processing = true
    story = build(:story)
    @uploader = StoryUploader.new(story, :image)
    @uploader.store!(File.open(File.join(File.dirname(__FILE__), "../support/store/carrierwave_test.gif")))
  end

  after do
    StoryUploader.enable_processing = false
    @uploader.remove!
  end

  it "should constrain the image to a width of 400" do
    expect(@uploader).to have_width(400)
  end
end
