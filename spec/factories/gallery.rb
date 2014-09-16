FactoryGirl.define do
  factory :gallery do
    title {Faker::Name.first_name}
    description {Faker::Lorem.paragraph}
    site_id {Faker::Number.digit}
  end

  factory :invalid_gallery, parent: :gallery do
    title nil
    description nil
  end
end
