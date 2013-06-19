FactoryGirl.define do
  factory :tag do |t|
    t.sequence(:text) { |i| "my tag number #{i}" }
    #association :post, :factory => :post
  end
end