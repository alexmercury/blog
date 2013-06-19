# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  text       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ActiveRecord::Base
  #attr_accessible :id, :cont

  has_many :uniteds
  has_many :posts, :through => :uniteds

  validates :text,
            :presence => true,
            :length => { :minimum => 3, :maximum => 15 },
            :uniqueness => true

end
