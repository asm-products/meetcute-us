FactoryGirl.define do
  factory :site do
    user_id {Faker::Number.digit}
    name {Faker::Name.first_name}
    description {Faker::Lorem.paragraph}
    analytics "MyString"
    password_protected false
    is_indexed false
    design_id {Faker::Number.digit}
    subdomain {Faker::Internet.domain_word}
  end

  factory :invalid_site, parent: :site do |f|
    f.subdomain nil
  end

end
