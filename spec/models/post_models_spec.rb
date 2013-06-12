require 'spec_helper'

describe Post do

  it { should have_many(:post_comments).dependent(:destroy) }
  it { should belong_to(:user) }
  it { should have_many(:uniteds) }
  it { should have_many(:tags).through(:uniteds) }
  it { should accept_nested_attributes_for(:tags) }

  it { should have_db_column(:title).of_type(:string) }
  it { should have_db_column(:body).of_type(:text) }
  it { should have_db_column(:data).of_type(:datetime) }
  it { should have_db_column(:created_at).of_type(:datetime).with_options(:null => false) }
  it { should have_db_column(:updated_at).of_type(:datetime).with_options(:null => false) }
  it { should have_db_column(:user_id).of_type(:integer) }
  it { should have_db_column(:post_comments_count).of_type(:integer).with_options(:default => 0) }
  it { should have_db_column(:status).of_type(:integer).with_options(:default => 0) }
  it { should have_db_column(:adm_comment).of_type(:text) }

  it { should validate_presence_of(:data) }
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }
  it { should ensure_length_of(:title).is_at_least(5).is_at_most(30) }
  it { should validate_presence_of(:body) }
  it { should ensure_length_of(:body).is_at_least(10) }
  it { should validate_presence_of(:user_id) }
  it { should validate_numericality_of(:user_id) }


end