require 'spec_helper'

describe PostsController do

  before :each do
    @user = FactoryGirl.create(:user)
  end

  context 'GET #index' do

    it 'render #index' do
      get :index
      response.should render_template(:index)
    end

    it 'assigns all posts to @posts' do
      post = FactoryGirl.create :post, :status => 1
      get :index
      expect(assigns(:posts)).to  eq([post])
    end

  end

  context 'GET #show' do

    it 'render #show' do
      get :show, :id => FactoryGirl.create(:post)
      response.should render_template :show
    end

    it 'assigns the requested post to @post' do
      post = FactoryGirl.create :post
      get :show, :id => post
      assigns(:post).should eq(post)
    end

  end

  context 'GET #new' do
    it 'render #new' do
      sign_in @user
      get :new, :id => FactoryGirl.create(:post)
      response.should render_template :new
    end

  end

=begin
  it 'Post show' do
    #get :show, {'id' => 1}
   should_not get(:show, {'id' => 1})
  end

  it 'Post show [id]' do
    FactoryGirl.create(:post, :id => 1)
    get :show, {'id' => 1}
    response.should be_success
  end
=end

end