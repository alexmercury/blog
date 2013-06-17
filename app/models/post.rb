# == Schema Information
#
# Table name: posts
#
#  id                  :integer          not null, primary key
#  title               :string(255)
#  body                :text
#  data                :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :integer
#  post_comments_count :integer          default(0)
#  status              :integer          default(0)
#  adm_comment         :text
#

class Post < ActiveRecord::Base

  attr_protected :user_id, :status, :adm_comment, :as => :blog_user

  has_many :post_comments, :dependent => :destroy
  belongs_to :user, :counter_cache => true

  has_many :uniteds
  has_many :tags, :through => :uniteds

  accepts_nested_attributes_for :tags, :reject_if => lambda { |a| a[:cont].blank? }, :allow_destroy => true

  validates_presence_of :data

  validates :title,
            :presence => true,
            :length => { :minimum => 5, :maximum => 30 },
            :uniqueness => true
  validates :body,
            :presence => true,
            :length => { :minimum => 10}
  validates :user_id,
            :presence => true,
            :numericality => { :only_integer => true, :greater_than => 0 }

  scope :index_posts, where('status > 0').order('updated_at desc')
  scope :posts_not, where('status = 0')
  scope :not_hidden_title, where(" title  NOT LIKE '%hidden%' ")

end
