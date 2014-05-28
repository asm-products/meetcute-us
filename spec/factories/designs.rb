FactoryGirl.define do
  factory :design do
    name {Faker::Name.first_name}
    description {Faker::Lorem.paragraph}
  end
end
