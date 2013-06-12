class United < ActiveRecord::Base
  attr_accessible :post_id, :tag_id

  belongs_to :post
  belongs_to :tag

  validates_uniqueness_of :post_id, :scope => :tag_id
end
