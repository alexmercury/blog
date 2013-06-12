require 'spec_helper'

describe United do

  it { should belong_to(:post) }
  it { should belong_to(:tag) }

  it { should have_db_column(:post_id).of_type(:integer) }
  it { should have_db_column(:tag_id).of_type(:integer) }

  it { should validate_uniqueness_of(:post_id).scoped_to(:tag_id) }
  it { should validate_presence_of(:post_id) }
  it { should validate_presence_of(:tag_id) }

end