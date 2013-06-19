# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  user_name              :string(255)
#  post_comments_count    :integer          default(0)
#  posts_count            :integer          default(0)
#

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
