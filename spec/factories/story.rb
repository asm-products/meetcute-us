FactoryGirl.define do
  factory :story do
    title { Faker::Name.first_name }
    content { Faker::Lorem.paragraph }
    site_id { Faker::Number.digit }
	display_order { Faker::Number.digit }
  end

  factory :invalid_story, parent: :story do |f|
    f.date nil
  end
end

