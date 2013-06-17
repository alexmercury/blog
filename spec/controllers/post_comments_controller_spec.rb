require 'spec_helper'

describe PostCommentsController do
=begin
  before :each do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  it 'rerer' do
    sign_in @user

    post :create, :post_comment => FactoryGirl.attributes_for(:post_comment)
    comment =  PostComment.first
    response.should redirect_to comment
  end
=end

end