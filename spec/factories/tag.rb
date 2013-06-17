FactoryGirl.define do
  factory :tag do |t|
    t.sequence(:cont) { |i| "my tag number #{i}" }
    #association :post, :factory => :post
  end
end