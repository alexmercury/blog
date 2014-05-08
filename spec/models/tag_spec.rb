require 'spec_helper'

describe Tag do

  context 'Tag model connection' do
    it { should have_many(:uniteds) }
    it { should have_many(:posts).through(:uniteds) }
  end

  context 'Tag db column' do
    it { should have_db_column(:text).of_type(:string) }
    it { should have_db_column(:created_at).of_type(:datetime).with_options(:null => false) }
    it { should have_db_column(:updated_at).of_type(:datetime).with_options(:null => false) }
  end

  context 'Tag model validation' do
    it { should validate_presence_of(:text) }
    it { should validate_uniqueness_of(:text) }
    it { should ensure_length_of(:text).is_at_least(3).is_at_most(15) }
  end

end