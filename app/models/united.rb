# == Schema Information
#
# Table name: uniteds
#
#  id      :integer          not null, primary key
#  post_id :integer
#  tag_id  :integer
#

class United < ActiveRecord::Base
  #attr_accessible :post_id, :tag_id

  belongs_to :post
  belongs_to :tag

  validates_uniqueness_of :post_id, :scope => :tag_id
  validates_presence_of :post_id, :tag_id
end
