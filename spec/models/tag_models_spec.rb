require 'spec_helper'

describe Tag do

  it { should have_many(:uniteds) }
  it { should have_many(:posts).through(:uniteds) }

  it { should have_db_column(:cont).of_type(:string) }
  it { should have_db_column(:created_at).of_type(:datetime).with_options(:null => false) }
  it { should have_db_column(:updated_at).of_type(:datetime).with_options(:null => false) }

  it { should validate_presence_of(:cont) }
  it { should validate_uniqueness_of(:cont) }
  it { should ensure_length_of(:cont).is_at_least(3).is_at_most(15) }

end