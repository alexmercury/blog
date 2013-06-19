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

    it 'assigns post to @posts' do
      post = FactoryGirl.create :post, :status => 1
      get :index
      controller.instance_variable_get(:@posts).last.title.should == post.title
    end

    it '@posts includes(:user)' do
      post = @user.posts.create(FactoryGirl.attributes_for(:post, :status => 1))
      get :index
      controller.instance_variable_get(:@posts).last.user.user_name.should == @user.user_name
      controller.instance_variable_get(:@posts).last.title.should == post.title
    end

  end

  context 'GET #show' do

    it 'render #show' do
      get :show, :id => FactoryGirl.create(:post)
      response.should render_template :show
    end

    it 'requested post to @post' do
      post = FactoryGirl.create :post
      get :show, :id => post
      controller.instance_variable_get(:@post).title.should == post.title
    end

  end

  context 'authenticate user' do

    before :each do
      sign_in @user
    end

    context 'GET #new' do

      it 'render #new' do
        get :new
        response.should render_template :new
      end

    end

    context 'POST #create' do

      it 'User with >= 3 Untested posts' do
        @user.posts.create(FactoryGirl.attributes_for(:post, :status => 0))
        @user.posts.create(FactoryGirl.attributes_for(:post, :status => 0))
        @user.posts.create(FactoryGirl.attributes_for(:post, :status => 0))
        post :create, :post => FactoryGirl.attributes_for(:post, :listTags => {'0'=> 0})
        response.should redirect_to panel_url
      end

      it 'User with < 3 Untested posts' do
        @user.posts.create(FactoryGirl.attributes_for(:post, :status => 0))
        post :create, :post => FactoryGirl.attributes_for(:post, :listTags => {'0'=> 0})
        post = Post.last
        response.should redirect_to post
      end

      it 'Create invalid post' do
        post :create, :post => {}
        response.should render_template :new
      end

    end

    context 'PUT #update' do

      before :each do
        @post = @user.posts.create(FactoryGirl.attributes_for(:post))
      end

      context 'valid attributes' do

        it 'requested post to @post' do
          put :update, :id => @post, :post => FactoryGirl.attributes_for(:post, :listTags => {'0'=> 0})
          @post.reload
          controller.instance_variable_get(:@post).title.should == @post.title
        end

        it 'changes @post attributes' do
          put :update, :id => @post, :post => FactoryGirl.attributes_for(:post,:listTags => {'0'=> 0}, :title => 'Update my post')
          @post.reload
          @post.title.should == 'Update my post'
        end

        it 'redirect to post' do
          put :update, :id => @post, :post => FactoryGirl.attributes_for(:post,:listTags => {'0'=> 0})
          response.should redirect_to @post
        end

      end

      context 'invalid attributes' do

        before :each do
          @title = @post.title
        end

        it 'changes @posts attributes' do
          put :update, :id => @post, :post => {:title => ''}
          @post.reload.title.should == @title
        end

        it 'redirect to edit' do
          put :update, :id => @post, :post => {}
          response.should redirect_to @post
        end

      end

    end

    context 'DELETE #destroy' do

      before :each do
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
        get :panel
        response.should render_template(:panel)
      end

      it 'assigns post to @posts' do
        post = @user.posts.create(FactoryGirl.attributes_for(:post, :status => 0))
        FactoryGirl.create(:post, :status => 0)
        get :panel
        controller.instance_variable_get(:@posts).count.should == 1
        controller.instance_variable_get(:@posts).last.user_id.should == post.user_id
      end

    end
  end

  context 'before_filter :add_all_tag' do
    before :each do
      sign_in @user
      @post = @user.posts.create(FactoryGirl.attributes_for(:post))
      @tag = @post.tags.create(:text => 'tag 1')
    end

    it '@tags in index' do
      get :index
      controller.instance_variable_get(:@tags).last.text.should == @tag.text
    end
    it '@tags in show' do
      get :show, :id => @post
      controller.instance_variable_get(:@tags).last.text.should == @tag.text
    end
    it '@tags in update' do
      put :update, :id => @post, :post => FactoryGirl.attributes_for(:post, :listTags => {'0'=> 0})
      controller.instance_variable_get(:@tags).last.text.should == @tag.text
    end
    it '@tags in new' do
      get :new, :id => FactoryGirl.create(:post)
      controller.instance_variable_get(:@tags).last.text.should == @tag.text
    end
    it '@tags in create' do
      post :create, :post => FactoryGirl.attributes_for(:post, :listTags => {'0'=> 0})
      controller.instance_variable_get(:@tags).last.text.should == @tag.text
    end
    it '@tags in panel' do
      get :panel
      controller.instance_variable_get(:@tags).last.text.should == @tag.text
    end

  end

end