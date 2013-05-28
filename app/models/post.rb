class Post < ActiveRecord::Base
  attr_accessible :body, :data, :title
  
  has_many :comments
end
