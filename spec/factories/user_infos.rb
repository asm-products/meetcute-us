# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_info do
    user_id 1
    first_name "MyString"
    last_name "MyString"
    username "MyString"
    stripe_customer_token "MyString"
    wedding_date "2014-02-12"
    subscription_id 1
    site_id 1
  end
end
