FactoryGirl.define do
  factory :post_comment do
    text 'my comment in this blog'
    association :post, :factory => :post
    association :user, :factory => :user
  end
end