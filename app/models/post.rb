class Post < ActiveRecord::Base
  attr_accessible :body, :data, :title
  
  has_many :bcomments, :dependent => :destroy
  belongs_to :user,  :counter_cache => true

  has_many :uniteds
  has_many :tags, :through => :uniteds
  accepts_nested_attributes_for :tags


  #default_scope { where(" title  NOT LIKE '%hidden%' ")}
  
  validates_presence_of :body, :data, :title
  
end
