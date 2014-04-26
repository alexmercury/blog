class Tag < ActiveRecord::Base
  #attr_accessible :id, :cont

  has_many :uniteds
  has_many :posts, :through => :uniteds

  validates :text,
            :presence => true,
            :length => { :minimum => 3, :maximum => 15 },
            :uniqueness => true

end
