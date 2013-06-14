FactoryGirl.define do
  factory :user do  |u|
    u.sequence(:email) { |i| "super#{i}user@mail.com"}
    u.sequence(:user_name){ |i| "user#{i}" }
    u.password '123456'
  end
end


