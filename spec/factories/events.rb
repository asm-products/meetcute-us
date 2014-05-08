FactoryGirl.define do
  factory :event do
    date "2014-05-08 14:31:22"
    title {Faker::Name.first_name}
    description {Faker::Lorem.paragraph}
    component_id {Faker::Number.digit}
  end

  factory :invalid_event, parent: :event do |f|
    f.date nil
  end
end
