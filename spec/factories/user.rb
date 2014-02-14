FactoryGirl.define do
  factory :user do 
    sequence(:id) {|n| n}
    user_info_id 1
    sequence(:email) { |n| "test#{n}@test.com" } 
    password "secret1234"
  end
end