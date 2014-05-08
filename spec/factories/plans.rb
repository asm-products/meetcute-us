FactoryGirl.define do
  factory :plan do |f|
    f.amount 1
    f.interval "MyString"
    f.name "MyString"
    f.currency "MyString"
    f.stripe_id "MyString"
  end

  factory :invalid_plan, parent: :plan do |f|
    f.amount nil
  end
end
