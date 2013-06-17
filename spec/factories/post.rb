require 'spec_helper'

FactoryGirl.define do
  factory :post do  |p|
    p.sequence(:title) { |i| "my post number #{i}" }
    p.body 'Its is my first post in this blog'
    p.data { Time.new }
    association :user, :factory => :user
  end
end