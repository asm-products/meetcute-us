# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :plan do
    amount 1
    interval "MyString"
    name "MyString"
    currency "MyString"
    stripe_id "MyString"
  end
end
