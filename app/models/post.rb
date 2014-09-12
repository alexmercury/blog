class Post < ActiveRecord::Base

  has_many :post_comments, dependent: :destroy

  belongs_to :user, counter_cache: true

  has_and_belongs_to_many :tags

  accepts_nested_attributes_for :tags, reject_if: lambda { |tag| tag[:text].blank? }, allow_destroy: true

  validates :title,
            :presence => true,
            :length => { :minimum => 5, :maximum => 255 },
            :uniqueness => true
  validates :body,
            :presence => true,
            :length => { :minimum => 10}
  validates :user_id,
            :presence => true,
            :numericality => { :only_integer => true, :greater_than => 0 }

  scope :index_posts, -> {where('status > 0').order('updated_at desc')}
  scope :posts_not, -> {where('status = 0')}
  scope :not_hidden_title, -> {where(" title  NOT LIKE '%hidden%' ")}

end