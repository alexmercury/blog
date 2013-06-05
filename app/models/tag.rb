class Tag < ActiveRecord::Base
  attr_accessible :id, :cont

  has_many :uniteds
  has_many :posts, :through => :uniteds
  accepts_nested_attributes_for :posts

end
