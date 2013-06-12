class Post < ActiveRecord::Base

  attr_protected :user_id, :status, :adm_comment
  #attr_accessible :body, :data, :title,
  
  has_many :bcomments, :dependent => :destroy
  belongs_to :user,  :counter_cache => true

  has_many :uniteds
  has_many :tags, :through => :uniteds
  accepts_nested_attributes_for :tags, :reject_if => lambda { |a| a[:cont].blank? }, :allow_destroy => true

  #default_scope { where(" title  NOT LIKE '%hidden%' ")}

  # SELECT all post with status > 0
  #default_scope { where('status > 0')}
  
  validates_presence_of :body, :data, :user_id

  validates :title,
            :presence => true,
            :length => { :minimum => 5, :maximum => 30 },
            :uniqueness => true

  validates :body,
            :length => { :minimum => 10}

  validates :user_id,
            :numericality => { :only_integer => true, :greater_than => 0 }


  scope :index_posts, where('status > 0').order('updated_at desc')
  scope :posts_not, where('status = 0')

=begin
  def self.posts_error
    error_posts = Post.where('status = 0').count('id')
        Post.where('status = 0 and user_id ='+current_user.id.to_s).count('id')
      #SELECT COUNT(*) FROM table;
      record.errors[:base] << "This person is evil"
    end
  end
=end

end
