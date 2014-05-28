FactoryGirl.define do
  factory :account do
    user_id {Faker::Number.digit}
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    username {Faker::Internet.user_name}
    stripe_customer_token "MyString"
    wedding_date "2014-02-12"
    subscription_id 1
    site_id {Faker::Number.digit}
  end

  factory :invalid_account, parent: :account do
    first_name nil
  end

  factory :second_account, parent: :account do
    stripe_customer_token "SecondStripeString"
    wedding_date "2016-02-04"
    subscription_id 2
  end
end
