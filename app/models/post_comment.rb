class PostComment < ActiveRecord::Base
  
	belongs_to :post, :counter_cache => true
  belongs_to :user,  :counter_cache => true

  validates_presence_of :post_id, :user_id

  validates :text,
            :presence => true,
            :length => { :minimum => 5, :maximum => 250 }
end
