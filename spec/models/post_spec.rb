require 'spec_helper'

describe Post do

  context 'Post model attribute can not be set on mass update' do
    it { should_not allow_mass_assignment_of(:user_id).as(:blog_user) }
    it { should_not allow_mass_assignment_of(:status).as(:blog_user) }
    it { should_not allow_mass_assignment_of(:adm_comment).as(:blog_user) }
  end

  context 'Post model connection' do
    it { should have_many(:post_comments).dependent(:destroy) }
    it { should belong_to(:user) }
    it { should have_many(:uniteds) }
    it { should have_many(:tags).through(:uniteds) }
    it { should accept_nested_attributes_for(:tags) }
  end
  context 'Post db column' do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:body).of_type(:text) }
    it { should have_db_column(:data).of_type(:datetime) }
    it { should have_db_column(:created_at).of_type(:datetime).with_options(:null => false) }
    it { should have_db_column(:updated_at).of_type(:datetime).with_options(:null => false) }
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:post_comments_count).of_type(:integer).with_options(:default => 0) }
    it { should have_db_column(:status).of_type(:integer).with_options(:default => 0) }
    it { should have_db_column(:adm_comment).of_type(:text) }
  end
  context 'Post model validation' do
    it { should validate_presence_of(:data) }
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
    it { should ensure_length_of(:title).is_at_least(5).is_at_most(30) }
    it { should validate_presence_of(:body) }
    it { should ensure_length_of(:body).is_at_least(10) }
    it { should validate_presence_of(:user_id) }
    it { should validate_numericality_of(:user_id) }
  end
  context 'Post model scope' do
    it 'scope -> :index_posts' do
      FactoryGirl.create(:post, status: 1 )
      FactoryGirl.create(:post, status: 0  )

      posts = Post.index_posts
      posts.count.should be 1
    end
    it 'scope -> :posts_not' do
      FactoryGirl.create(:post)
      FactoryGirl.create(:post, status: 1  )

      posts = Post.posts_not
      posts.count.should be 1
    end
    it 'scope -> :not_hidden_title' do
      FactoryGirl.create(:post)
      FactoryGirl.create(:post, title: 'second post hidden' )

      posts = Post.not_hidden_title
      posts.count.should be 1
    end
  end

  it 'user counter_cache 'do
    user = FactoryGirl.create(:user)
    user.posts.create(:title => 'My Post 1', :body => 'Post Post Post Post Post', :data => Time.new)
    user.posts.create(:title => 'My Post 2', :body => 'Post Post Post Post Post', :data => Time.new)

    count_2 = (User.first.posts_count == 2)
    user.posts.first.destroy

    if count_2
      User.first.posts_count.should be 1
    else
      count_2.should be true
    end

  end

end