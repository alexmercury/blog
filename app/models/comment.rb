class Comment < ActiveRecord::Base
  attr_accessible :post_id, :text
  
	belongs_to :post
  belongs_to :user
	
	validates_presence_of :text
end
