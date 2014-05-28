require 'spec_helper'

describe Tag do

  context 'Tag model connection' do
    it { should have_and_belong_to_many(:posts) }
  end

  context 'Tag db column' do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:created_at).of_type(:datetime) }
    it { should have_db_column(:updated_at).of_type(:datetime) }
  end

  context 'Tag model validation' do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
    it { should ensure_length_of(:title).is_at_least(3).is_at_most(15) }
  end

end