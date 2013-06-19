require 'spec_helper'

describe TagsController do

  context 'GET #show' do
    before :each do
      FactoryGirl.create :post
      @post = FactoryGirl.create :post
      @tag = @post.tags.create(:text => 'tag 1')
    end

    it 'render #show' do
      get :show, :id => @tag
      response.should render_template :show
    end

    it 'assigns the requested post to @post' do
      get :show, :id => @tag
      controller.instance_variable_get(:@posts).last.title.should == @post.title
    end

  end

end