FactoryGirl.define do
  factory :user do |f|
    f.account_id {Faker::Number.digit}
    f.email {Faker::Internet.email} 
    f.password {Faker::Internet.password}
  end

  factory :invalid_user, parent: :user do |f|
    f.email nil
  end
end