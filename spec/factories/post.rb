require 'spec_helper'

FactoryGirl.define do
  factory :post do  |p|
    p.sequence(:title) { |i| "my post number #{i}" }
    p.body 'Its is my first post in this blog'
    association :user, :factory => :user
  end
end