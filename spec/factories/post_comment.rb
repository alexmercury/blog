FactoryGirl.define do
  factory :post_comment do
    text 'iyfygfoyguy'
    association :post, :factory => :post
    association :user#, :factory => :user
  end
end