class Post < ActiveRecord::Base
  attr_accessible :body, :data, :title
  
  has_many :comments, :dependent => :destroy
  belongs_to :user


  #default_scope { where(" title  NOT LIKE '%hidden%' ")}
  
  validates_presence_of :body, :data, :title
  
end
