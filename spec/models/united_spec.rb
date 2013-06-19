# == Schema Information
#
# Table name: uniteds
#
#  id      :integer          not null, primary key
#  post_id :integer
#  tag_id  :integer
#

require 'spec_helper'

describe United do
  context 'United model connection' do
    it { should belong_to(:post) }
    it { should belong_to(:tag) }
  end

  context 'United db column' do
    it { should have_db_column(:post_id).of_type(:integer) }
    it { should have_db_column(:tag_id).of_type(:integer) }
  end

  context 'United model validation' do
    it { should validate_uniqueness_of(:post_id).scoped_to(:tag_id) }
    it { should validate_presence_of(:post_id) }
    it { should validate_presence_of(:tag_id) }
  end
end
