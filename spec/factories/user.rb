FactoryGirl.define do
  factory :user do 
    account_id {Faker::Number.digit}
    email {Faker::Internet.email} 
    password {Faker::Internet.password}
  end

  factory :invalid_user do
    email nil
  end
end