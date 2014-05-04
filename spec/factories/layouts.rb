FactoryGirl.define do
  factory :layout do
    name {Faker::Name.first_name}
    description {Faker::Lorem.paragraph}
    site_id {Faker::Number.digit}
  end
end
