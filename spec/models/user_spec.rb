require 'spec_helper'

describe User do

  context 'User model connection' do
    it { should have_many(:posts) }
    it { should have_many(:post_comments) }
  end

  context 'User db column' do
    it { should have_db_column(:user_name).of_type(:string) }
    it { should have_db_column(:posts_count).of_type(:integer).with_options(:default => 0) }
    it { should have_db_column(:post_comments_count).of_type(:integer).with_options(:default => 0) }
  end

end