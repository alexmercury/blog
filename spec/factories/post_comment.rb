FactoryGirl.define do
  factory :post_comment do
    text 'my comment'
    association :post, :factory => :post
    association :user, :factory => :user
  end
end