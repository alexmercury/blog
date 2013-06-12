class Tag < ActiveRecord::Base
  #attr_accessible :id, :cont

  has_many :uniteds
  has_many :posts, :through => :uniteds
  #accepts_nested_attributes_for :posts, :reject_if => lambda { |a| a[:cont].blank? }, :allow_destroy => true

  validates_uniqueness_of :cont

end
