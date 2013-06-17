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
        @title = @post.title
      end

      it 'locates the requested @post' do
        put :update, :id => @post, :post => {}
        assigns(:post).should eq(@post)
      end

      it 'changes @posts attributes' do
        put :update, :id => @post, :post => {:title => ''}
        @post.reload.title.should == @title
      end

      it 're-redirect to edit' do
        put :update, :id => @post, :post => {}
        response.should redirect_to @post
      end

    end



  end

  context 'DELETE #destroy' do

    before :each do
      sign_in @user
      @post = @user.posts.create(FactoryGirl.attributes_for(:post))
    end

    it 'post destroy' do
      expect{
        delete :destroy, :id => @post
      }.to change(Post,:count).by(-1)
    end

    it 'redirects to posts#index' do
      delete :destroy, :id => @post
      response.should redirect_to posts_url
    end

  end

  context 'GET #panel' do

    it 'render panel' do
      sign_in @user
      get :panel
      response.should render_template(:panel)
    end

  end

  context 'before_filter :add_all_tag' do
    before :each do
      sign_in @user
      @post = @user.posts.create(FactoryGirl.attributes_for(:post))
      @tag = @post.tags.create(:cont => 'tag 1')
    end

    it '@tags in index' do
      get :index
      expect(assigns(:tags)).to  eq([@tag])
    end
    it '@tags in show' do
      get :show, :id => @post
      expect(assigns(:tags)).to  eq([@tag])
    end
    it '@tags in update' do
      put :update, :id => @post, :post => FactoryGirl.attributes_for(:post, :listTags => {'0'=> 0})
      expect(assigns(:tags)).to  eq([@tag])
    end
    it '@tags in new' do
      get :new, :id => FactoryGirl.create(:post)
      expect(assigns(:tags)).to  eq([@tag])
    end
    it '@tags in create' do
      post :create, :post => FactoryGirl.attributes_for(:post, :listTags => {'0'=> 0})
      expect(assigns(:tags)).to  eq([@tag])
    end
    it '@tags in panel' do
      get :panel
      expect(assigns(:tags)).to  eq([@tag])
    end

  end

end