# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

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
    sub_domain {Faker::Internet.domain_word}
  end

  factory :invalid_account, parent: :account do |f|
    f.first_name nil
  end
end
