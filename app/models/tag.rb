class Tag < ActiveRecord::Base

  has_and_belongs_to_many :posts, join_table: 'posts_tags'

  validates :title,
            :presence => true,
            :length => { :minimum => 3, :maximum => 15 },
            :uniqueness => true
end