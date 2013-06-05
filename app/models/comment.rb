class Comment < ActiveRecord::Base
  attr_accessible :post_id, :text
  
	belongs_to :post, :counter_cache => true
  belongs_to :user,  :counter_cache => true
	
	validates_presence_of :text
end
