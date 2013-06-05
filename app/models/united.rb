class United < ActiveRecord::Base
  attr_accessible :id_posts, :id_tags

  belongs_to :post
  belongs_to :tag

end
