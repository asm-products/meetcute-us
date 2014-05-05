FactoryGirl.define do
  factory :user do |f|
    f.account_id {Faker::Number.digit}
    f.email {Faker::Internet.email} 
    f.password "test1234"
    f.role :guest
  end
  
  factory :invalid_user, parent: :user do |f|
    f.email nil
  end

  factory :admin_user, parent: :user do |f|
    f.role :admin
  end

  factory :bronze_user, parent: :user do |f|
    f.role :bronze
  end

  factory :silver_user, parent: :user do |f|
    f.role :silver
  end

  factory :gold_user, parent: :user do |f|
    f.role :gold
  end

end