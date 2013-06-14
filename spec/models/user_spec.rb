require 'spec_helper'

describe User do

  context 'User model attribute can be set on mass update' do
    it { should allow_mass_assignment_of(:email) }
    it { should allow_mass_assignment_of(:password) }
    it { should allow_mass_assignment_of(:password_confirmation) }
    it { should allow_mass_assignment_of(:remember_me) }
    it { should allow_mass_assignment_of(:user_name) }
  end

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