FactoryGirl.define do
  factory :image do
    caption {Faker::Lorem.paragraph}
    visible 1
    image "http://placekitten.com/300/300"
  end

  factory :invalid_image, parent: :image do
    visible nil
  end
end
