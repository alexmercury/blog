require 'spec_helper'

describe PostComment do

  context 'PostComment model connection' do
    it { should belong_to(:post) }
    it { should belong_to(:user) }
  end

  context 'PostComment db column' do
    it { should have_db_column(:post_id).of_type(:integer) }
    it { should have_db_column(:text).of_type(:text) }
    it { should have_db_column(:created_at).of_type(:datetime).with_options(:null => false) }
    it { should have_db_column(:updated_at).of_type(:datetime).with_options(:null => false) }
    it { should have_db_column(:user_id).of_type(:integer) }
  end

  context 'PostComment model validation' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:post_id) }
    it { should validate_presence_of(:text) }
    it { should ensure_length_of(:text).is_at_least(5).is_at_most(250) }
  end

  context 'User counter_cache 'do
    before :each do
      FactoryGirl.create(:user)
      User.first.post_comments.create(:text => '123456', :post_id => 1)
      User.first.post_comments.create(:text => '123456', :post_id => 1)
    end

    it 'Counter+ (create PostComment)' do
      User.first.post_comments_count.should be 2
    end

    it 'Counter- (destroy PostComment)' do
      User.first.post_comments.first.destroy
      User.first.post_comments_count.should be 1
    end
  end

  context 'Post counter_cache 'do
    before :each do
      FactoryGirl.create(:post)
      Post.first.post_comments.create(:text => '123456', :user_id => 1)
      Post.first.post_comments.create(:text => '123456', :user_id => 1)
    end

    it 'Counter+ (create PostComment)' do
      Post.first.post_comments_count.should be 2
    end

    it 'Counter- (destroy PostComment)' do
      Post.first.post_comments.first.destroy
      Post.first.post_comments_count.should be 1
    end
  end
end