# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscription do
    ammount ""
    interval "MyString"
    name "MyString"
    currency "MyString"
    plan_id "MyString"
  end
end
