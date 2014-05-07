FactoryGirl.define do
  factory :design do
    name {Faker::Name.first_name}
    description {Faker::Lorem.paragraph}
    site_id {Faker::Number.digit}
  end
end
