FactoryGirl.define do
  factory :account do |f|
    f.user_id {Faker::Number.digit}
    f.first_name {Faker::Name.first_name}
    f.last_name {Faker::Name.last_name}
    f.username {Faker::Internet.user_name}
    f.stripe_customer_token "MyString"
    f.wedding_date "2014-02-12"
    f.subscription_id 1
    f.site_id {Faker::Number.digit}
  end

  factory :invalid_account, parent: :account do |f|
    f.first_name nil
  end
end
