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

    it 'assigns the requested post to @post' do
      sign_in @user
      post = FactoryGirl.create(:post)
      get :show, :id => post
      assigns(:post).should eq(post)
    end

  end

  context 'POST #create' do
    it 'User with >= 3 Untested posts' do
      sign_in @user
      @user.posts.create(FactoryGirl.attributes_for(:post, :status => 0))
      @user.posts.create(FactoryGirl.attributes_for(:post, :status => 0))
      @user.posts.create(FactoryGirl.attributes_for(:post, :status => 0))

      post :create, :post => FactoryGirl.attributes_for(:post, :listTags => {'0'=> 0})
      response.should redirect_to panel_url
    end
    it 'User with < 3 Untested posts' do
      sign_in @user

      post :create, :post => FactoryGirl.attributes_for(:post, :listTags => {'0'=> 0})
      post =  Post.first
      response.should redirect_to post
    end
    it 'Create invalid post' do
      sign_in @user
      post :create, :post => {}
      response.should render_template :new
    end
  end

  context 'PUT #update' do

    before :each do
      sign_in @user
      @post = @user.posts.create(FactoryGirl.attributes_for(:post))
    end

    context 'valid attributes' do

      it 'located the requested @post' do
        put :update, :id => @post, :post => FactoryGirl.attributes_for(:post, :listTags => {'0'=> 0})
        assigns(:post).should eq(@post)
      end

      it 'changes @post attributes' do
        put :update, :id => @post, :post => FactoryGirl.attributes_for(:post,:listTags => {'0'=> 0}, :title => 'Update my post')
        @post.reload
        @post.title.should eq('Update my post')
      end

      it 'redirect to post' do
        put :update, id: @post, post: FactoryGirl.attributes_for(:post)
        response.should redirect_to @post
      end

    end

    context 'invalid attributes' do
      before :each do
        @first_name = @user.first_name
      end

      it 'locates the requested @post' do
        put :update, :id => @user, :user => FactoryGirl.attributes_for(:invalid_user)
        assigns(:user).should eq(@user)
      end

      it "changes @user's attributes" do
        put :update, :id => @user, :user => {:first_name => nil}
        @user.reload.first_name.should == @first_name
      end

      it "re-redirect to edit" do
        put :update, :id => @user, :user => {:first_name => nil, :last_name => nil}
        response.should render_template :edit
      end

    end



  end

end