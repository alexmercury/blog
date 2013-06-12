require 'spec_helper'

describe PostComment do

  it { should belong_to(:post) }
  it { should belong_to(:user) }

  it { should have_db_column(:post_id).of_type(:integer) }
  it { should have_db_column(:text).of_type(:text) }
  it { should have_db_column(:created_at).of_type(:datetime).with_options(:null => false) }
  it { should have_db_column(:updated_at).of_type(:datetime).with_options(:null => false) }
  it { should have_db_column(:user_id).of_type(:integer) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:post_id) }
  it { should validate_presence_of(:text) }
  it { should validate_uniqueness_of(:text) }
  it { should ensure_length_of(:text).is_at_least(5).is_at_most(250) }
end