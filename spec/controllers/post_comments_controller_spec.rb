require 'spec_helper'

describe PostCommentsController do
=begin
  before :each do
    @user = FactoryGirl.create(:user)
    sign_in @user
    post = @user.posts.create(FactoryGirl.attributes_for(:post, :status => 0, :title => '000000'))
    @post_comment = post.post_comments.create(:text => 'my comment in this blog',:user_id => 1)
  end

  it 'post comment destroy' do
    expect{
      delete :destroy, :id => @post_comment
    }.to change(PostComment,:count).by(-1)
  end
=end
end